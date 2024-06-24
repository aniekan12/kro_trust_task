import 'package:flutter/material.dart';
import 'package:kro_trust_task/modules/widgets/inputs/kro_text_field.dart';

abstract class KroInputForm {
  List<InputController> get inputControllers;

  bool isFormValid();

  final ValueNotifier<bool> _validated = ValueNotifier<bool>(false);

  ValueNotifier<bool> get validState => _validated;

  KroInputForm() {
    for (var element in inputControllers) {
      element.controller.addListener(() async {
        _validated.value = isFormValid();
      });
    }
  }

  clearForm() {
    for (var element in inputControllers) {
      element.controller.clear();
    }
  }
}
