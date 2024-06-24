import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kro_trust_task/core/navigation/app_pages.dart';
import 'package:kro_trust_task/modules/home/presentation/bloc/side_nav/side_nav_bloc.dart';
import 'package:kro_trust_task/modules/home/presentation/screens/home_screen.dart';
import 'package:kro_trust_task/modules/login/presentation/screens/login_root.dart';
import 'package:kro_trust_task/modules/transaction_history/presentation/bloc/transaction_history/transaction_history_bloc.dart';
import 'package:kro_trust_task/modules/transaction_history/presentation/screens/transaction_history_screen.dart';
import 'package:kro_trust_task/modules/transfers/presentation/screens/transfer_screen.dart';

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
            builder: (context, state) => BlocProvider(
                  create: (context) => SideNavBloc(),
                  child: const HomeScreen(),
                )),
        GoRoute(
            path: AppPages.transactionHistory,
            name: AppPages.transactionHistory,
            builder: (context, state) => BlocProvider(
                  create: (context) => TransactionHistoryBloc()
                    ..add(TransactionHistoryEvent.fetchTransactionHistory()),
                  child: const TransactionHistoryScreen(),
                )),
        GoRoute(
            path: AppPages.transfers,
            name: AppPages.transfers,
            builder: (context, state) => const TransferScreen())
      ],
    );
