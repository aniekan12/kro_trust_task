import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kro_resources/presentation/base/kro_responsive.dart';
import 'package:kro_trust_task/modules/login/presentation/bloc/login/login_bloc.dart';
import 'package:kro_trust_task/modules/login/presentation/screens/desktop/desktop_login_screen.dart';
import 'package:kro_trust_task/modules/login/presentation/screens/mobile/mobile_login_screen.dart';

class LoginRoot extends StatelessWidget {
  const LoginRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const KroResponsive(
        mobile: MobileLoginScreen(),
        desktop: DesktopLoginScreen(),
      ),
    );
  }
}
