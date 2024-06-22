import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kro_trust_task/modules/login/data/dto/login_dto.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';
import 'package:kro_trust_task/modules/login/domain/usecases/login_usecase.dart';

part 'login_state.dart';
part 'login_event.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _loginUsecase;

  LoginBloc({LoginUsecase? loginUsecase})
      : _loginUsecase = loginUsecase ?? LoginUsecase.instance(),
        super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.map(
        login: (_) async {
          final input = LoginDto(
            email: _.loginDto.email,
            password: _.loginDto.password,
          );
          final result = await _loginUsecase.invoke(input);
          result.fold(
            (l) => emit(LoginState.error(l.message)),
            (r) => emit(LoginState.next(r)),
          );
        },
        logout: (_) {},
      );
    });
  }
}
