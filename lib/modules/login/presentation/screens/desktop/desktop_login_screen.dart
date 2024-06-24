import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';
import 'package:kro_trust_task/modules/login/presentation/bloc/login/login_bloc.dart';
import 'package:kro_trust_task/modules/login/presentation/widgets/login_button.dart';
import 'package:kro_trust_task/modules/widgets/inputs/kro_text_field.dart';
import 'package:kro_trust_task/utils/extensions.dart';

class DesktopLoginScreen extends StatefulWidget {
  const DesktopLoginScreen({super.key});

  @override
  State<DesktopLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<DesktopLoginScreen> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<LoginBloc>();

    return Scaffold(
      backgroundColor: KroColors.white.shade700,
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: context.mq.size.height,
                width: context.mq.size.width * 0.4,
                color: KroColors.primary,
                child: Center(
                  child: Text(
                    'KRO TRUST LOGIN',
                    style: KroBodyTextStyles.large.copyWith(
                      color: KroColors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KroTextField.text(
                      labelText: 'Email',
                      hintText: 'Email',
                      inputController: bloc.form.emailController),
                  20.verticalGap,
                  KroTextField.text(
                      labelText: 'Password',
                      hintText: 'Password',
                      inputController: bloc.form.passwordController),
                  100.verticalGap,
                  LoginButton(bloc: bloc),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
