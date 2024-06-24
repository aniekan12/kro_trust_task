import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:kro_trust_task/modules/home/presentation/bloc/side_nav/side_nav_bloc.dart';
import 'package:kro_trust_task/modules/transaction_history/presentation/bloc/transaction_history/transaction_history_bloc.dart';
import 'package:kro_trust_task/modules/transfers/presentation/bloc/transfer/transfer_bloc.dart';
import 'package:oktoast/oktoast.dart';

class KroEntryPoint extends StatefulWidget {
  const KroEntryPoint({super.key});

  @override
  State<KroEntryPoint> createState() => _KroEntryPointState();
}

class _KroEntryPointState extends State<KroEntryPoint> {
  final _router = locator.get<GoRouter>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransactionHistoryBloc()
            ..add(TransactionHistoryEvent.fetchTransactionHistory()),
        ),
        BlocProvider(
          create: (context) => SideNavBloc(),
        ),
        BlocProvider(
          create: (context) => TransferBloc(),
        ),
      ],
      child: OKToast(
        child: MaterialApp.router(
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
