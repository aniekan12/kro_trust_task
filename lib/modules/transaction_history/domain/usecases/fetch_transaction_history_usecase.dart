import 'package:dartz/dartz.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:kro_trust_task/core/usecase/usecase.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';
import 'package:kro_trust_task/modules/transaction_history/data/repository/transaction_history_repository.dart';

class FetchTransactionHistoryUseCase
    extends UseCase<void, KroException, Transaction> {
  FetchTransactionHistoryUseCase(
      {TransactionHistoryRepository? transactionHistoryRepository})
      : _repository = transactionHistoryRepository ??
            locator<TransactionHistoryRepository>();

  factory FetchTransactionHistoryUseCase.instance() =>
      locator<FetchTransactionHistoryUseCase>();

  final TransactionHistoryRepository _repository;

  @override
  Future<Either<KroException, Transaction>> invoke([void input]) {
    return _repository.getTransactionHistory();
  }
}
