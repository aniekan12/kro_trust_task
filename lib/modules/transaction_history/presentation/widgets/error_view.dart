import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';
import 'package:kro_trust_task/common/theme/typography/kro_header_text_styles.dart';
import 'package:kro_trust_task/modules/transaction_history/presentation/bloc/transaction_history/transaction_history_bloc.dart';
import 'package:kro_trust_task/utils/extensions.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TransactionHistoryBloc>();
    return GestureDetector(
      onTap: () => bloc.add(TransactionHistoryEvent.fetchTransactionHistory()),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Oops! we encountered an error completing your request.",
              style: KroBodyTextStyles.medium,
              textAlign: TextAlign.center,
            ),
            8.verticalGap,
            const Text(
              "Tap to retry",
              style: KroHeaderTextStyles.medium,
            ),
          ],
        ),
      ),
    );
  }
}
