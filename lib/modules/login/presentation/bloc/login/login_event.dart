part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.login({required LoginDto loginDto}) = _Login;
  const factory LoginEvent.logout() = _Logout;
}
