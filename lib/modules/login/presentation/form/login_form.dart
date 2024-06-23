import 'package:kro_trust_task/modules/widgets/forms/kro_input_form.dart';
import 'package:kro_trust_task/modules/widgets/inputs/kro_input_validator.dart';
import 'package:kro_trust_task/modules/widgets/inputs/kro_text_field.dart';

class LoginForm extends KroInputForm {
  final emailController =
      InputController(validator: InputValidators.validateEmail);
  final passwordController =
      InputController(validator: InputValidators.validatePassword);

  @override
  List<InputController> get inputControllers => [
        emailController,
        passwordController,
      ];

  @override
  bool isFormValid() =>
      emailController.isValid() && passwordController.isValid();
}
