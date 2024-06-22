import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';

abstract class TransactionHistoryDatasource {
  Future<Transaction> getTransactions();
}
