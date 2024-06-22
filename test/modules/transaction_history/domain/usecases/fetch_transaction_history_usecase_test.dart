import 'package:flutter_test/flutter_test.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/modules/transaction_history/data/datasources/transaction_history_datasource.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';
import 'package:kro_trust_task/modules/transaction_history/data/repository/transaction_history_repository.dart';
import 'package:kro_trust_task/modules/transaction_history/domain/repository/transaction_history_impl.dart';
import 'package:kro_trust_task/modules/transaction_history/domain/usecases/fetch_transaction_history_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/navigation/mock_data.dart';
import '../../data/datasources/transaction_history_datasource_test.mocks.dart';

void main() async {
  late TransactionHistoryDatasource apiDataSource;
  late TransactionHistoryRepository repository;
  late FetchTransactionHistoryUseCase useCase;
  setUp(() {
    apiDataSource = MockTransactionHistoryDatasource();
    repository = TransactionHistoryRepositoryImpl(
        transactionHistoryDatasource: apiDataSource);
    useCase = FetchTransactionHistoryUseCase(
        transactionHistoryRepository: repository);
  });

  test('should verify fetch transactions is successful', () async {
    when(apiDataSource.getTransactions())
        .thenAnswer((_) async => Transaction.fromJson(mockTransactionResponse));

    final res = await useCase.invoke();
    res.fold(
      (l) => expect(l, isA<KroException>()),
      (r) => expect(r, isA<Transaction>()),
    );
    verify(apiDataSource.getTransactions()).called(1);
  });
}
