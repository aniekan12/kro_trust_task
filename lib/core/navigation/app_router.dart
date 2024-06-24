import 'package:go_router/go_router.dart';
import 'package:kro_trust_task/core/navigation/app_pages.dart';
import 'package:kro_trust_task/modules/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:kro_trust_task/modules/home/presentation/screens/home_screen.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';
import 'package:kro_trust_task/modules/login/presentation/screens/login_root.dart';
import 'package:kro_trust_task/modules/transaction_history/presentation/screens/transaction_history_screen.dart';
import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';
import 'package:kro_trust_task/modules/transfers/presentation/screens/transfer_screen.dart';
import 'package:kro_trust_task/modules/transfers/presentation/screens/transfer_success_terminal.dart';

GoRouter appRouter() => GoRouter(
      initialLocation: AppPages.login,
      routes: [
        GoRoute(
          path: AppPages.login,
          name: AppPages.login,
          builder: (context, state) => const LoginRoot(),
        ),
        GoRoute(
            path: AppPages.home,
            name: AppPages.home,
            builder: (context, state) {
              final data = state.extra as LoginResponse;
              return HomeScreen(data: data);
            }),
        GoRoute(
            path: AppPages.transactionHistory,
            name: AppPages.transactionHistory,
            builder: (context, state) => const TransactionHistoryScreen()),
        GoRoute(
            path: AppPages.transfers,
            name: AppPages.transfers,
            builder: (context, state) => const TransferScreen()),
        GoRoute(
            path: AppPages.transferSuccess,
            name: AppPages.transferSuccess,
            builder: (context, state) {
              final data = state.extra as TransferResponse;
              return TransferSuccessTerminal(
                transferResponse: data,
              );
            }),
        GoRoute(
            path: AppPages.dashboard,
            name: AppPages.dashboard,
            builder: (context, state) {
              final data = state.extra as LoginResponse;
              return DashboardScreen(data: data);
            }),
      ],
    );
