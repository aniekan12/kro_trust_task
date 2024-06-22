part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loadInProgress() = _LoadInProgress;
  const factory LoginState.next(LoginResponse response) = _Next;
  const factory LoginState.error(String message) = _Error;
}
