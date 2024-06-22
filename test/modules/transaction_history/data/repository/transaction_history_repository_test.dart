import 'package:flutter_test/flutter_test.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/modules/transaction_history/data/datasources/transaction_history_datasource.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';
import 'package:kro_trust_task/modules/transaction_history/data/repository/transaction_history_repository.dart';
import 'package:kro_trust_task/modules/transaction_history/domain/repository/transaction_history_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/navigation/mock_data.dart';
import '../datasources/transaction_history_datasource_test.mocks.dart';

void main() {
  late TransactionHistoryDatasource transactionHistoryDatasource;
  late TransactionHistoryRepository transactionHistoryRepository;
  setUp(() {
    transactionHistoryDatasource = MockTransactionHistoryDatasource();
    transactionHistoryRepository = TransactionHistoryRepositoryImpl(
        transactionHistoryDatasource: transactionHistoryDatasource);
  });
  group('transaction history repository', () {
    test('should return transactions', () async {
      final response = Transaction.fromJson(mockTransactionResponse);

      when(transactionHistoryDatasource.getTransactions())
          .thenAnswer((_) async => response);
      final res = await transactionHistoryRepository.getTransactionHistory();
      res.fold(
        (l) => expect(l, isA<KroException>()),
        (r) => expect(r, isA<Transaction>()),
      );
    });
  });
}
