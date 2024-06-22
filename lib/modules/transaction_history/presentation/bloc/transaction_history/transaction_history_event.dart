part of 'transaction_history_bloc.dart';

@freezed
class TransactionHistoryEvent with _$TransactionHistoryEvent {
  factory TransactionHistoryEvent.fetchTransactionHistory() =
      _FetchTransactionHistory;
}
