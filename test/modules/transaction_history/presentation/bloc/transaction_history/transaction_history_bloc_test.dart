import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kro_trust_task/core/base/base_state.bloc.dart';
import 'package:kro_trust_task/modules/transaction_history/data/datasources/transaction_history_datasource.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';
import 'package:kro_trust_task/modules/transaction_history/data/repository/transaction_history_repository.dart';
import 'package:kro_trust_task/modules/transaction_history/domain/repository/transaction_history_impl.dart';
import 'package:kro_trust_task/modules/transaction_history/domain/usecases/fetch_transaction_history_usecase.dart';
import 'package:kro_trust_task/modules/transaction_history/presentation/bloc/transaction_history/transaction_history_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../../../core/mock_data.dart';
import '../../../data/datasources/transaction_history_datasource_test.mocks.dart';

void main() {
  late TransactionHistoryDatasource transactionHistoryDatasource;
  late TransactionHistoryRepository transactionHistoryRepository;
  late FetchTransactionHistoryUseCase transactionHistoryUseCase;
  setUpAll(() {
    transactionHistoryDatasource = MockTransactionHistoryDatasource();
    transactionHistoryRepository = TransactionHistoryRepositoryImpl(
        transactionHistoryDatasource: transactionHistoryDatasource);
    transactionHistoryUseCase = FetchTransactionHistoryUseCase(
        transactionHistoryRepository: transactionHistoryRepository);

    when(transactionHistoryDatasource.getTransactions())
        .thenAnswer((_) async => Transaction.fromJson(mockTransactionResponse));
  });

  group('transaction history bloc', () {
    blocTest<TransactionHistoryBloc, BaseBlocState<Transaction>>(
        'emits login success when fetch transaction history event is added.',
        build: () => TransactionHistoryBloc(
            fetchTransactionHistoryUseCase: transactionHistoryUseCase),
        act: (bloc) {
          bloc.add(TransactionHistoryEvent.fetchTransactionHistory());
        },
        expect: () => <BaseBlocState<Transaction>>[
              const BaseBlocState.loading(),
              BaseBlocState.next(Transaction.fromJson(mockTransactionResponse)),
            ]);
  });
}
