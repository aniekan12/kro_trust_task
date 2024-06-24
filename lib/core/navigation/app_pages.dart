import 'package:equatable/equatable.dart';

class AppPages extends Equatable {
  static const String login = '/';
  static const String home = '/home';
  static const String transactionHistory = '/transaction-history';
  static const String transfers = '/transfers';
  static const String transferSuccess = '/transfer-success';
  static const String dashboard = '/dashboard';

  @override
  List<Object?> get props => [
        login,
        home,
        transactionHistory,
        transfers,
        dashboard,
      ];
}
