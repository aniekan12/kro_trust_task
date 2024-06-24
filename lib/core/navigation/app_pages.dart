import 'package:equatable/equatable.dart';

class AppPages extends Equatable {
  static const String login = '/';
  static const String home = '/home';
  static const String transactionHistory = '/transaction-history';
  static const String transfers = '/transfers';

  @override
  List<Object?> get props => [login, home];
}
