import 'package:dartz/dartz.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';

abstract class TransactionHistoryRepository {
  Future<Either<KroException, Transaction>> getTransactionHistory();
}
