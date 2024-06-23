import 'package:equatable/equatable.dart';

class TransferDto extends Equatable {
  final String accountNumber;
  final double amount;

  const TransferDto({required this.accountNumber, required this.amount});

  @override
  List<Object?> get props => [accountNumber, amount];
}
