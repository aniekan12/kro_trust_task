import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/core/mocks/mock_responses.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';
import 'package:kro_trust_task/utils/future_extensions.dart';

import 'transaction_history_datasource.dart';

class TransactionHistoryDatasourceImpl implements TransactionHistoryDatasource {
  @override
  Future<Transaction> getTransactions() async {
    try {
      await delay(5.seconds);
      return Transaction.fromJson(mockTransactionResponse);
    } catch (e) {
      throw KroException.fromMessage('Invalid Token!');
    }
  }
}
