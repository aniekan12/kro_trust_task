import 'package:dartz/dartz.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:kro_trust_task/modules/transfers/data/datasources/transfer_datasource.dart';
import 'package:kro_trust_task/modules/transfers/data/dto/transfer_dto.dart';
import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';
import 'package:kro_trust_task/modules/transfers/data/repository/transfer_repository.dart';

class TransferRepositoryImpl implements TransferRepository {
  final TransferDataSource _dataSource;

  TransferRepositoryImpl({TransferDataSource? dataSource})
      : _dataSource = dataSource ?? locator<TransferDataSource>();

  @override
  Future<Either<KroException, TransferResponse>> transferMoney(
      {required TransferDto dto}) async {
    try {
      final result = await _dataSource.transferMoney(transferDto: dto);
      return Right(result);
    } on KroException catch (e) {
      return Left(KroException(
          statusCode: e.statusCode,
          message: e.message,
          description: e.description,
          cause: e.cause));
    }
  }
}
