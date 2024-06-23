// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferResponseImpl _$$TransferResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferResponseImpl(
      amount: json['amount'] as String?,
      message: json['message'] as String?,
      description: json['description'] as String?,
      recepient: json['recepient'] as String?,
    );

Map<String, dynamic> _$$TransferResponseImplToJson(
        _$TransferResponseImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'message': instance.message,
      'description': instance.description,
      'recepient': instance.recepient,
    };
