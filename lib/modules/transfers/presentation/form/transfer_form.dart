import 'package:kro_trust_task/modules/widgets/forms/kro_input_form.dart';
import 'package:kro_trust_task/modules/widgets/inputs/kro_input_validator.dart';
import 'package:kro_trust_task/modules/widgets/inputs/kro_text_field.dart';

class TransferForm extends KroInputForm {
  final amountController =
      InputController(validator: InputValidators.validateAmount);

  final accountNumberController = InputController();
  @override
  List<InputController> get inputControllers => [
        amountController,
        accountNumberController,
      ];

  @override
  bool isFormValid() =>
      amountController.isValid() && accountNumberController.isValid();
}
