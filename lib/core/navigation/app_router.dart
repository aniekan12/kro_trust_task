import 'package:go_router/go_router.dart';
import 'package:kro_trust_task/core/navigation/app_pages.dart';
import 'package:kro_trust_task/modules/home/presentation/screens/home_screen.dart';
import 'package:kro_trust_task/modules/login/presentation/screens/login_screen.dart';

GoRouter appRouter() => GoRouter(
      initialLocation: AppPages.login,
      routes: [
        GoRoute(
          path: AppPages.login,
          name: AppPages.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
            path: AppPages.home,
            name: AppPages.home,
            builder: (context, state) => const HomeScreen())
      ],
    );
