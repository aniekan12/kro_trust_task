import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kro_trust_task/core/base/base_state.bloc.dart';
import 'package:kro_trust_task/modules/transaction_history/data/models/transactions.dart';
import 'package:kro_trust_task/modules/transaction_history/domain/usecases/fetch_transaction_history_usecase.dart';
part 'transaction_history_event.dart';
part 'transaction_history_bloc.freezed.dart';

class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, BaseBlocState<Transaction>> {
  final FetchTransactionHistoryUseCase _fetchTransactionHistoryUseCase;

  TransactionHistoryBloc(
      {FetchTransactionHistoryUseCase? fetchTransactionHistoryUseCase})
      : _fetchTransactionHistoryUseCase = fetchTransactionHistoryUseCase ??
            FetchTransactionHistoryUseCase.instance(),
        super(const BaseBlocState.init()) {
    on<TransactionHistoryEvent>((event, emit) async {
      event.map(fetchTransactionHistory: (event) async {
        emit(const BaseBlocState.loading());
        final result = await _fetchTransactionHistoryUseCase.invoke();
        result.fold((l) {
          emit(BaseBlocState.error(l.message));
        }, (r) {
          emit(BaseBlocState.next(r));
        });
      });
    });
  }
}
