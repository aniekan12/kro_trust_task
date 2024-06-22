import 'package:flutter/material.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';
import 'package:kro_trust_task/modules/widgets/buttons/kro_button.dart';
import 'package:kro_trust_task/modules/widgets/inputs/kro_input.dart';
import 'package:kro_trust_task/utils/extensions.dart';

class DesktopLoginScreen extends StatefulWidget {
  const DesktopLoginScreen({super.key});

  @override
  State<DesktopLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<DesktopLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KroColors.white,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KroInput.text(
                    labelText: 'Email',
                    hintText: 'Email',
                    controller: TextEditingController()),
                // 20.verticalGap,
                KroInput.password(
                    labelText: 'Password',
                    hintText: 'Password',
                    controller: TextEditingController()),
                20.verticalGap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: KroButton.primary(
                    title: 'Login',
                    onTap: () {},
                    state: ValueNotifier(false),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
