import 'package:flutter/material.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';
import 'package:kro_trust_task/modules/transaction_history/presentation/widgets/transaction_item.dart';
import 'package:kro_trust_task/utils/app_date_formatter.dart';
import 'package:grouped_list/sliver_grouped_list.dart';

class TransactionHistoryItemView extends StatelessWidget {
  final List<TransactionData>? transactions;
  const TransactionHistoryItemView({super.key, this.transactions});
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverGroupedListView<TransactionData, int>(
          elements: transactions ?? [],
          groupBy: (transactions) {
            DateTime dateTime =
                DateTime.parse(transactions.date?.substring(0, 10) ?? '');
            int millisecondsSinceEpoch = dateTime.millisecondsSinceEpoch;
            return millisecondsSinceEpoch;
          },
          groupSeparatorBuilder: (int groupByValue) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                        AppDateFormatter.formatGroupListDate(groupByValue)
                            .toUpperCase(),
                        style: KroBodyTextStyles.small.copyWith(fontSize: 13)),
                  ),
                  // 16.5.verticalGap,
                ],
              ),
          order: GroupedListOrder.DESC,
          indexedItemBuilder: (context, transaction, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: TransactionItem(
                onTap: () {},
                transaction: transaction,
              ),
            );
          }),
    );
  }
  //
  // return Container()
}
