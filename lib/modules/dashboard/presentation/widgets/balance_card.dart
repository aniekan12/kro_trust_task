import 'package:flutter/material.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/common/theme/kro_size_config.dart';
import 'package:kro_trust_task/common/theme/typography/kro_header_text_styles.dart';
import 'package:kro_trust_task/utils/extensions.dart';

enum AccountType {
  savings('Savings'),
  checking('Checking');

  final String type;
  const AccountType(this.type);
}

class BalanceCard extends StatelessWidget {
  final String accountType;
  final int balance;
  final Color color;
  final IconData icon;

  const BalanceCard({
    super.key,
    required this.accountType,
    required this.balance,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        height: SizeConfig.pxToHeight(200),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: KroColors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 40),
                10.horizontalGap,
                Flexible(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    accountType,
                    style: KroHeaderTextStyles.medium
                        .copyWith(color: KroColors.black),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              balance.formatCurrency,
              style: KroHeaderTextStyles.large.copyWith(color: KroColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
