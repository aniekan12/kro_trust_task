import 'package:equatable/equatable.dart';

class AppPages extends Equatable {
  static const String login = '/';
  static const String home = '/home';

  @override
  List<Object?> get props => [login, home];
}
