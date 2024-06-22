import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.bloc.freezed.dart';

@freezed
sealed class BaseBlocState<T> with _$BaseBlocState<T> {
  const factory BaseBlocState.init() = _Init;
  const factory BaseBlocState.loading() = _Loading;
  const factory BaseBlocState.next(T data) = _Success<T>;
  const factory BaseBlocState.error(String error) = _Error;
}
