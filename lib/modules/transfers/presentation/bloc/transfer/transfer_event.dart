part of 'transfer_bloc.dart';

@freezed
class TransferEvent with _$TransferEvent {
  factory TransferEvent.transferMoney() = _TransferMoney;
}
