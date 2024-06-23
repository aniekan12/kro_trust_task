import 'package:dartz/dartz.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:kro_trust_task/core/usecase/usecase.dart';
import 'package:kro_trust_task/modules/transfers/data/dto/transfer_dto.dart';
import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';
import 'package:kro_trust_task/modules/transfers/data/repository/transfer_repository.dart';

class TransferMoneyUseCase
    extends UseCase<TransferDto, KroException, TransferResponse> {
  final TransferRepository _transferRepository;

  TransferMoneyUseCase({TransferRepository? transferRepository})
      : _transferRepository =
            transferRepository ?? locator<TransferRepository>();

  factory TransferMoneyUseCase.instance() => locator<TransferMoneyUseCase>();

  @override
  Future<Either<KroException, TransferResponse>> invoke(TransferDto input) {
    return _transferRepository.transferMoney(dto: input);
  }
}
