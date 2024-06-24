import 'package:flutter/material.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';
import 'package:kro_trust_task/utils/extensions.dart';

class TransactionItem extends StatelessWidget {
  final TransactionData transaction;
  final void Function()? onTap;
  const TransactionItem({
    super.key,
    this.onTap,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${transaction.type}',
                  style:
                      KroBodyTextStyles.large.copyWith(color: KroColors.black),
                ),
                Text(
                  transaction.amount ?? '',
                  style:
                      KroBodyTextStyles.large.copyWith(color: KroColors.black),
                ),
              ],
            ),
            4.verticalGap,
            Text(
              'Date: ${transaction.date}',
              style:
                  KroBodyTextStyles.small.copyWith(color: KroColors.greyText),
            ),
            4.verticalGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Description: ${transaction.description}',
                  style: KroBodyTextStyles.small
                      .copyWith(color: KroColors.bodyText),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: KroColors.primary,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
