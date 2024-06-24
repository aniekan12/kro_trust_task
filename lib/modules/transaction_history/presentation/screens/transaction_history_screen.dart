import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/core/base/base_state.bloc.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';
import 'package:kro_trust_task/modules/transaction_history/presentation/bloc/transaction_history/transaction_history_bloc.dart';
import 'package:kro_trust_task/modules/transaction_history/presentation/widgets/error_view.dart';
import 'package:kro_trust_task/modules/transaction_history/presentation/widgets/transaction_history_item_view.dart';
import 'package:kro_trust_task/modules/widgets/app_bar/kro_app_bar.dart';
import 'package:kro_trust_task/modules/widgets/loaders/kro_loader.dart';
import 'package:kro_trust_task/utils/extensions.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KroColors.smoke,
      appBar: KroAppBar.primary(
        title: "Transaction History",
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.verticalGap,
                  ],
                ),
              ),
            ),
            BlocConsumer<TransactionHistoryBloc,
                BaseBlocState<List<TransactionData>>>(
              builder: (context, state) {
                log(state.toString());
                return state.when(
                    init: () => const SliverToBoxAdapter(child: KroLoader()),
                    loading: () => const SliverToBoxAdapter(child: KroLoader()),
                    next: (next) =>
                        TransactionHistoryItemView(transactions: next),
                    error: (error) => const ErrorView());
              },
              listener: (context, state) {},
            ),
          ],
        ),
      ),
    );
  }
}
