import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';
import 'package:kro_trust_task/modules/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:kro_trust_task/modules/home/presentation/bloc/side_nav/side_nav_bloc.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';
import 'package:kro_trust_task/modules/transaction_history/presentation/screens/transaction_history_screen.dart';
import 'package:kro_trust_task/modules/transfers/presentation/screens/transfer_screen.dart';

class HomeScreen extends StatefulWidget {
  final LoginResponse data;
  const HomeScreen({super.key, required this.data});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tabData = [
    {"icon": Icons.dashboard, "label": "Dashboard"},
    {"icon": Icons.history, "label": "Transaction History"},
    {"icon": Icons.money, "label": "Transfers"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SideNavBloc, SideNavState>(
        builder: (context, state) {
          return Row(
            children: [
              NavigationRail(
                backgroundColor: KroColors.primary,
                labelType: NavigationRailLabelType.all,
                onDestinationSelected: (value) => context
                    .read<SideNavBloc>()
                    .add(SideNavEvent.changeTab(value)),
                selectedIconTheme:
                    const IconThemeData(color: KroColors.primary),
                unselectedIconTheme:
                    const IconThemeData(color: KroColors.white),
                selectedLabelTextStyle:
                    KroBodyTextStyles.medium.copyWith(color: KroColors.white),
                unselectedLabelTextStyle:
                    KroBodyTextStyles.medium.copyWith(color: KroColors.white),
                destinations: List.generate(
                  tabData.length,
                  (index) => NavigationRailDestination(
                    icon: Icon(tabData[index]["icon"] as IconData?),
                    label: Text(tabData[index]["label"] as String),
                  ),
                ),
                selectedIndex: state.pageIndex,
              ),
              Expanded(child: _renderChild(state.pageIndex)),
            ],
          );
        },
      ),
    );
  }

  Widget _renderChild(index) {
    return switch (index) {
      0 => DashboardScreen(data: widget.data),
      1 => const TransactionHistoryScreen(),
      2 => const TransferScreen(),
      _ => Container(),
    };
  }
}
