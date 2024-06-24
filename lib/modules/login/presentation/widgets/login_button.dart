import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/core/base/base_state.bloc.dart';
import 'package:kro_trust_task/core/navigation/app_pages.dart';
import 'package:kro_trust_task/modules/login/presentation/bloc/login/login_bloc.dart';
import 'package:kro_trust_task/modules/widgets/alerts/kro_alerts.dart';
import 'package:kro_trust_task/modules/widgets/buttons/kro_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.bloc,
  });

  final LoginBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, BaseBlocState>(
      listener: (context, state) {
        state.when(
          init: () {},
          loading: () {},
          next: (data) {
            context.pushReplacement(AppPages.home, extra: data);
            KroAlerts.success(message: "Welcome", context: context);
          },
          error: (error) {
            KroAlerts.error(message: error.description, context: context);
          },
        );
      },
      builder: (context, state) {
        return state.when(
          init: () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: KroButton.primary(
              title: 'Login',
              onTap: () => bloc.add(const LoginEvent.login()),
              state: bloc.form.validState,
            ),
          ),
          loading: () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: KroButton.primary(
              title: 'Logging in...',
              onTap: () {},
              isLoading: true,
              state: ValueNotifier(false),
            ),
          ),
          next: (data) => const SizedBox.shrink(),
          error: (error) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: KroButton.primary(
              title: 'Login',
              onTap: () => bloc.add(const LoginEvent.login()),
              isLoading: false,
              state: bloc.form.validState,
            ),
          ),
        );
      },
    );
  }
}
