import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kro_trust_task/core/navigation/app_router.dart';
import 'package:kro_trust_task/core/navigation/navigation_service.dart';
import 'package:kro_trust_task/modules/login/data/datasource/user_datasource.dart';
import 'package:kro_trust_task/modules/login/data/datasource/user_datasource_impl.dart';
import 'package:kro_trust_task/modules/login/data/repository/user_repository.dart';
import 'package:kro_trust_task/modules/login/domain/repository/user_repository_impl.dart';
import 'package:kro_trust_task/modules/login/domain/usecases/login_usecase.dart';
import 'package:kro_trust_task/modules/transaction_history/data/datasources/transaction_history_datasource.dart';
import 'package:kro_trust_task/modules/transaction_history/data/datasources/transaction_history_datasource_impl.dart';
import 'package:kro_trust_task/modules/transaction_history/data/repository/transaction_history_repository.dart';
import 'package:kro_trust_task/modules/transaction_history/domain/repository/transaction_history_impl.dart';
import 'package:kro_trust_task/modules/transaction_history/domain/usecases/fetch_transaction_history_usecase.dart';

final locator = GetIt.instance;

Future<void> injector() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerSingleton<GoRouter>(appRouter());
  locator.registerFactory<UserDataSource>(() => UserDataSourceImpl());
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userDataSource: locator<UserDataSource>()));
  locator.registerLazySingleton<LoginUsecase>(() => LoginUsecase(
        userRepository: locator<UserRepository>(),
      ));
  locator.registerFactory<TransactionHistoryDatasource>(
      () => TransactionHistoryDatasourceImpl());
  locator.registerLazySingleton<TransactionHistoryRepository>(() =>
      TransactionHistoryRepositoryImpl(
          transactionHistoryDatasource:
              locator<TransactionHistoryDatasource>()));
  locator.registerLazySingleton<FetchTransactionHistoryUseCase>(() =>
      FetchTransactionHistoryUseCase(
        transactionHistoryRepository: locator<TransactionHistoryRepository>(),
      ));
}
