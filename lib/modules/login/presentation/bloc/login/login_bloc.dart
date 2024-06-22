import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kro_resources/common/io/resource.dart';
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
      event.map(
        login: (_) {
          final input = LoginDto(
            email: _.loginDto.email,
            password: _.loginDto.password,
          );
          _loginUsecase.execute(input).whenResource((event) {
            return switch (event) {
              Loading() => emit(const LoginState.loadInProgress()),
              Success(valueOrNull: final data) => emit(LoginState.next(data!)),
              Failure(throwable: final error) =>
                emit(LoginState.error(error.message)),
              _ => throw UnimplementedError(),
            };
          });
        },
        logout: (_) {},
      );
    });
  }
}
