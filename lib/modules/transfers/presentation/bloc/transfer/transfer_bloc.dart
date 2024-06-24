import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:kro_trust_task/core/base/base_state.bloc.dart';
import 'package:kro_trust_task/modules/transfers/data/dto/transfer_dto.dart';
import 'package:kro_trust_task/modules/transfers/data/models/transfer_response.dart';
import 'package:kro_trust_task/modules/transfers/domain/usecases/transfer_money_usecase.dart';
import 'package:kro_trust_task/modules/transfers/presentation/form/transfer_form.dart';
part 'transfer_event.dart';
part 'transfer_bloc.freezed.dart';

class TransferBloc
    extends Bloc<TransferEvent, BaseBlocState<TransferResponse>> {
  final TransferMoneyUseCase _transferMoneyUseCase;
  // final ShowReceiptUseCase _showReceiptUseCase;

  final form = TransferForm();
  TransferBloc({TransferMoneyUseCase? transferMoneyUseCase})
      : _transferMoneyUseCase =
            transferMoneyUseCase ?? locator<TransferMoneyUseCase>(),
        super(const BaseBlocState.init()) {
    on<TransferEvent>((event, emit) async {
      await event.map(transferMoney: (_) async {
        final input = TransferDto(
          accountNumber: form.accountNumberController.controller.text,
          amount: 100,
        );
        emit(const BaseBlocState.loading());
        final response = await _transferMoneyUseCase.invoke(input);
        response.fold(
          (l) => emit(BaseBlocState.error(l)),
          (r) {
            form.clearForm();
            emit(BaseBlocState.next(r));
          },
        );
      });
    });
  }
}
