import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kro_trust_task/core/navigation/app_router.dart';
import 'package:kro_trust_task/core/navigation/navigation_service.dart';

final locator = GetIt.instance;

Future<void> injector() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerSingleton<GoRouter>(appRouter());
}
