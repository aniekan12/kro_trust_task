import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/modules/login/presentation/bloc/login/login_bloc.dart';
import 'package:kro_trust_task/modules/login/presentation/widgets/login_button.dart';
import 'package:kro_trust_task/modules/widgets/app_bar/kro_app_bar.dart';
import 'package:kro_trust_task/modules/widgets/inputs/kro_text_field.dart';
import 'package:kro_trust_task/utils/extensions.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<MobileLoginScreen> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<LoginBloc>();
    return Scaffold(
      backgroundColor: KroColors.white,
      appBar: KroAppBar.primary(
          title: 'Login', backgroundColor: KroColors.inputBackground),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            KroTextField.text(
                labelText: 'Email',
                hintText: 'Email',
                inputController: bloc.form.emailController),
            20.verticalGap,
            KroTextField.password(
                labelText: 'Password',
                hintText: 'Password',
                inputController: bloc.form.passwordController),
            100.verticalGap,
            LoginButton(bloc: bloc),
          ],
        ),
      ),
    );
  }
}
