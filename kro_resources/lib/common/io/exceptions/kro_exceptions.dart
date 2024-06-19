import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kro_resources/common/io/exceptions/kro_response_type.dart';

class KroException implements Exception {
  KroException({
    required this.statusCode,
    required this.message,
    required this.description,
    required this.cause,
    this.responseCode,
    this.body,
  });

  factory KroException.fromTypeError(TypeError error) {
    log('KroException => TypeError $error');
    return KroException(
        statusCode: -1,
        message: '',
        description: error.toString(),
        cause: Exception(error));
  }

  factory KroException.fromHttpError(DioException error) {
    final response = error.response;
    final statusCode = error.response?.statusCode ?? -1;
    final statusMessage = response?.statusMessage ?? '';
    final dynamic body = response?.data;

    var message = '';
    var description = '';
    var newErrorBody = <String, dynamic>{};
    Exception cause = error;

    if (DioExceptionType.connectionTimeout == error.type ||
        DioExceptionType.receiveTimeout == error.type ||
        DioExceptionType.sendTimeout == error.type) {
      message = 'Connection Unavailable';
      description = "We're sorry, but it seems that we are currently "
          'experiencing connection issues. '
          'Please check your internet connection and try again. Thank you';
    } else if (DioExceptionType.connectionError == error.type ||
        error.error is SocketException) {
      message = 'Connection Unavailable';
      description = "We're sorry, but it seems that we are currently "
          'experiencing connection issues. '
          'Please check your internet connection and try again. Thank you';
    } else if (null == response || statusCode == 500) {
      message = 'Oops! Something Went Wrong';
      description = 'We encountered a problem while processing your request. '
          'We’re on it and will have it fixed soon. Please try again later.';
    } else if (DioExceptionType.badResponse == error.type ||
        (statusCode >= 501 && statusCode <= 599)) {
      //The backend will most times return an Html String here
      //We'll just try to detect if it's an xml and send a reformed message
      final trimmedStatusMessage = statusMessage.trim();
      if (trimmedStatusMessage.isNotEmpty &&
          statusMessage.startsWith('<') &&
          statusMessage.endsWith('>')) {
        message = 'Oops! Service Unavailable';
        description = 'We apologize, but we are currently unable to process '
            'your request. Please try again later. '
            'Thank you for your patience.';
      } else {
        message = 'Error Occurred';
        description =
            'An unexpected error occurred while processing your request. '
            'Please try again later. If the problem persists, '
            'please contact support for assistance.';
      }
    }

    if (null != body && body is Map<String, dynamic>) {
      newErrorBody = body;
      cause = _buildErrorFromBodyIfNeeded(cause, newErrorBody);
    } else if (null != body && body is String) {
      try {
        newErrorBody = jsonDecode(body) as Map<String, dynamic>;
        // let's provide further assist by reading the
        // body to know the errors, we can also update the cause
        cause = _buildErrorFromBodyIfNeeded(cause, newErrorBody);
      } on FormatException catch (e) {
        log('Failed to decode the body $e');
      }
    }

    //let's update the message and description from the newErrorBody
    message = newErrorBody[responseMessageKey] as String? ?? message;
    description = newErrorBody[responseDescriptionKey] as String? ??
        newErrorBody[responseDescriptionKey2] as String? ??
        description;

    return KroException(
        statusCode: statusCode,
        message: message,
        description: description,
        cause: cause,
        body: newErrorBody,
        responseCode: newErrorBody[responseCodeKey]?.toString());
  }

  factory KroException.empty() = _EmptyKroException;

  factory KroException.fromMessage(String message) = _FromMessageKroException;

  static const responseCodeKey = 'status';
  static const identifierKey = 'identifier';
  static const tokenDataKey = 'tokenData';
  static const responseMessageKey = 'message';
  static const responseDescriptionKey = 'message';
  static const responseDescriptionKey2 = 'description';
  static const ussdCodeKey = 'ussdCode';
  static const domainsKey = 'domains';
  static const usernameKey = 'name';
  static const phone = 'phone';
  static const email = 'email';
  static const customerAccountDetailsKey = 'customerAccountDetails';

  final int statusCode;
  final String? responseCode;
  final String message;
  final String description;
  final Map<String, dynamic>? body;
  final Exception cause;

  @override
  String toString() {
    return 'KroException: status=$statusCode, '
        'responseCode=$responseCode, message=$message,'
        ' description=$description, '
        'body=$body, cause=$cause';
  }

  static Exception _buildErrorFromBodyIfNeeded(
      Exception originalCause, Map<String, dynamic> errorBody) {
    if (errorBody.containsKey(responseCodeKey)) {
      final code =
          KroResponseType.fromCode('${errorBody[responseCodeKey] ?? ''}');
      switch (code) {
        case KroResponseType.DENIED:
          return InActiveAccountException(
            message: errorBody[responseMessageKey] as String? ?? '',
            cause: originalCause,
            responseCode: errorBody[responseCodeKey] as String? ?? '-1',
            phoneNumber: errorBody[phone] as String? ?? '',
            email: errorBody[email] as String? ?? '',
          );
        default:
          break;
      }
    }
    return originalCause;
  }
}

class _EmptyKroException extends KroException {
  _EmptyKroException()
      : super(
          message: '',
          description: '',
          cause: Exception(),
          statusCode: -1,
        );
}

class _FromMessageKroException extends KroException {
  _FromMessageKroException(String message)
      : super(
          message: '',
          description: message,
          cause: Exception(),
          statusCode: -1,
        );
}

class InActiveAccountException implements Exception {
  InActiveAccountException({
    required this.responseCode,
    required this.message,
    required this.cause,
    required this.phoneNumber,
    required this.email,
  });

  final String responseCode;
  final String message;
  final Exception cause;
  final String phoneNumber;
  final String email;
}
