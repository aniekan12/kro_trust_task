// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kro_trust_task/common/theme/kro_size_config.dart';

extension CurrencyUtil on num {
  static final f = NumberFormat("###,###,###,###,###,###,##0.00", "en_NG");
  static final _f2 = NumberFormat("#,##0", "en_NG");

  String get formatCurrencyWithoutSymbolAndDividing => f.format(this);

  String get formatCurrency => "₦${f.format(this)}";

  String get formatCurrencyWithoutSymbol => f.format(this / 100);

  String get formatCurrencyWithoutLeadingZero => "₦${_f2.format(this / 100)}";
}

extension XBuildContext on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  void hideKeyboard() {
    FocusScope.of(this).requestFocus(FocusNode());
  }
}

extension XString on String? {
  String get orEmpty => this ?? '';

  String get toTitleCase {
    return (this ?? '').split(' ').map((word) {
      if (word.isEmpty) {
        return word;
      }
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  bool get isEmail {
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailPattern.hasMatch(this ?? '');
  }

  String get cleanPhoneNumberForInput {
    if (this == null) return '';
    return '0${this?.replaceAll(RegExp(r'[^\d]'), '')}';
  }

  String get cleanAmountForInput {
    if (this == null) return ''; // Ensure null safety with a null check
    return '${this?.replaceAll(RegExp(r'[^\d.]'), '')}'; // Allow decimal point in addition to digits
  }

  String get trimNigerianPhoneNumber {
    if (orEmpty.startsWith('+234')) {
      return orEmpty.substring(4);
    } else if (orEmpty.startsWith('0')) {
      return orEmpty.substring(1);
    } else {
      return orEmpty;
    }
  }

  String get masked {
    if (orEmpty.length < 4) {
      return orEmpty;
    }
    return '****${orEmpty.substring(orEmpty.length - 4)}';
  }

  String append(String prefix) {
    return '$this$prefix';
  }

  String prepend(String prefix) {
    return '$prefix$this';
  }

  String get toReadableDate {
    final convertedDate = DateTime.tryParse(orEmpty);
    if (convertedDate == null) {
      return '';
    }
    final dateFormat = DateFormat('d MMM, yyyy h:mm:ss a');
    return dateFormat.format(convertedDate);
  }
}

extension AppSpacer on num {
  Widget get verticalGap => SizedBox(
        height: toDouble(),
      );

  Widget get horizontalGap => SizedBox(
        width: toDouble(),
      );

  double get pxToHeight => SizeConfig.pxToHeight(toDouble());

  double get pxToWidth => SizeConfig.pxToWidth(toDouble());

  double get radius => SizeConfig.radius(toDouble());
}
