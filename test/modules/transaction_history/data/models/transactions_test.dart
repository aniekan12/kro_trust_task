import 'package:flutter_test/flutter_test.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';

import '../../../../core/navigation/mock_data.dart';

void main() {
  group('Transaction', () {
    test('fromJson should create a Transaction object from a JSON map', () {
      final transaction = Transaction.fromJson(mockTransactionResponse);
      expect(transaction.data.length, 1);
      expect(transaction.data[0].date, '2024-05-01');
      expect(transaction.data[0].type, 'Opening');
      expect(transaction.data[0].amount, '-');
      expect(transaction.data[0].description, 'Opening balance');
    });
  });
}
