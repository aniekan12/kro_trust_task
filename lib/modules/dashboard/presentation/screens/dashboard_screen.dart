import 'package:flutter/material.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/common/theme/typography/kro_header_text_styles.dart';
import 'package:kro_trust_task/modules/dashboard/presentation/widgets/balance_card.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';
import 'package:kro_trust_task/utils/extensions.dart';

class DashboardScreen extends StatelessWidget {
  final LoginResponse data;
  const DashboardScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KroColors.smoke,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi 👋 ${data.userName}', style: KroHeaderTextStyles.large),
              40.verticalGap,
              Row(
                children: [
                  Expanded(
                    child: BalanceCard(
                      accountType: AccountType.savings.type,
                      balance: data.savingsBalance ?? 0,
                      color: Colors.blue,
                      icon: Icons.savings,
                    ),
                  ),
                  10.horizontalGap,
                  Expanded(
                    child: BalanceCard(
                      accountType: AccountType.checking.type,
                      balance: data.checkingsBalance ?? 0,
                      color: Colors.orange,
                      icon: Icons.account_balance_wallet,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
