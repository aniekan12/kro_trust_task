import 'package:freezed_annotation/freezed_annotation.dart';
part 'transactions.freezed.dart';
part 'transactions.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required List<TransactionData> data,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

@freezed
abstract class TransactionData with _$TransactionData {
  const factory TransactionData({
    String? date,
    String? type,
    String? amount,
    String? description,
  }) = _TransactionData;

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      _$TransactionDataFromJson(json);
}
