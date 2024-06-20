import 'package:flutter/material.dart';
import 'package:kro_trust_task/modules/widgets/inputs/kro_text_field.dart';

class KroInput {
  KroInput._();

  static Widget text(
      {required String labelText,
      required String hintText,
      required TextEditingController controller}) {
    return KroTextField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
    );
  }

  static Widget password(
      {required String labelText,
      required String hintText,
      required TextEditingController controller}) {
    return KroTextField(
      labelText: labelText,
      hintText: hintText,
      isPassword: true,
      controller: controller,
    );
  }
}
