import 'package:equatable/equatable.dart';

class LoginDto extends Equatable {
  final String email;
  final String password;

  const LoginDto({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
