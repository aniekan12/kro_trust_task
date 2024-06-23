import 'package:dartz/dartz.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:kro_trust_task/modules/transaction_history/data/datasources/transaction_history_datasource.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';
import 'package:kro_trust_task/modules/transaction_history/data/repository/transaction_history_repository.dart';

class TransactionHistoryRepositoryImpl implements TransactionHistoryRepository {
  final TransactionHistoryDatasource _transactionHistoryDatasource;

  TransactionHistoryRepositoryImpl(
      {TransactionHistoryDatasource? transactionHistoryDatasource})
      : _transactionHistoryDatasource = transactionHistoryDatasource ??
            locator<TransactionHistoryDatasource>();

  @override
  Future<Either<KroException, Transaction>> getTransactionHistory() async {
    try {
      final result = await _transactionHistoryDatasource.getTransactions();
      return Right(result);
    } catch (e) {
      return Left(KroException.fromMessage(e.toString()));
    }
  }
}
