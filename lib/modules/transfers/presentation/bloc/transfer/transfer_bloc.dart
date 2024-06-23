import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:kro_trust_task/core/base/base_state.bloc.dart';
import 'package:kro_trust_task/modules/transfers/data/dto/transfer_dto.dart';
import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';
import 'package:kro_trust_task/modules/transfers/domain/usecases/transfer_money_usecase.dart';
part 'transfer_event.dart';
part 'transfer_bloc.freezed.dart';

class TransferBloc
    extends Bloc<TransferEvent, BaseBlocState<TransferResponse>> {
  final TransferMoneyUseCase _transferMoneyUseCase;
  // final ShowReceiptUseCase _showReceiptUseCase;
  TransferBloc({TransferMoneyUseCase? transferMoneyUseCase})
      : _transferMoneyUseCase =
            transferMoneyUseCase ?? locator<TransferMoneyUseCase>(),
        super(const BaseBlocState.init()) {
    on<TransferEvent>((event, emit) async {
      event.map(
        transferMoney: (_) async {
          final input = TransferDto(
            accountNumber: _.transferDto.accountNumber,
            amount: _.transferDto.amount,
          );
          emit(const BaseBlocState.loading());
          final response = await _transferMoneyUseCase.invoke(input);
          response.fold((l) => emit(BaseBlocState.error(l)),
              (r) => emit(BaseBlocState.next(r)));
        },
      );
    });
  }
}
