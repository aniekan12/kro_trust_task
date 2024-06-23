import 'package:flutter_test/flutter_test.dart';
import 'package:kro_trust_task/modules/transaction_history/data/datasources/transaction_history_datasource.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../core/mock_data.dart';
import 'transaction_history_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TransactionHistoryDatasource>()])
void main() {
  group('transaction datasource', () {
    late TransactionHistoryDatasource dataSource;

    setUp(() {
      dataSource = MockTransactionHistoryDatasource();
    });

    test('login should call the correct method', () async {
      final response = Transaction.fromJson(mockTransactionResponse);

      when(dataSource.getTransactions()).thenAnswer((_) async => response);

      final result = await dataSource.getTransactions();

      expect(result, response);
      verify(dataSource.getTransactions()).called(1);
    });
  });
}
