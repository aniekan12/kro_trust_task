import 'package:flutter/material.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/modules/widgets/app_bar/kro_app_bar.dart';
import 'package:kro_trust_task/modules/widgets/buttons/kro_button.dart';
import 'package:kro_trust_task/modules/widgets/inputs/kro_input.dart';
import 'package:kro_trust_task/utils/extensions.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<MobileLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KroColors.white,
      appBar: KroAppBar.primary(title: 'Login'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
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
      ),
    );
  }
}
