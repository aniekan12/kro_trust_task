import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kro_trust_task/modules/home/presentation/bloc/side_nav/side_nav_bloc.dart';
import 'package:kro_trust_task/modules/transaction_history/presentation/screens/transaction_history_screen.dart';
import 'package:kro_trust_task/modules/transfers/presentation/screens/transfer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tabData = [
    {"icon": Icons.history, "label": "Transaction History"},
    {"icon": Icons.money, "label": "Transfers"},
    {"icon": Icons.library_books, "label": "Tab3"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SideNavBloc, SideNavState>(
        builder: (context, state) {
          return Row(
            children: [
              NavigationRail(
                labelType: NavigationRailLabelType.all,
                onDestinationSelected: (value) => context
                    .read<SideNavBloc>()
                    .add(SideNavEvent.changeTab(value)),
                selectedIconTheme: IconThemeData(color: Colors.red),
                unselectedIconTheme: IconThemeData(color: Colors.black),
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
      0 => const TransactionHistoryScreen(),
      1 => const TransferScreen(),
      2 => Container(),
      _ => Container(),
    };
  }
}
