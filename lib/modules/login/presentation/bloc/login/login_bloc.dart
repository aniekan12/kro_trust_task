import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kro_trust_task/core/base/base_state.bloc.dart';
import 'package:kro_trust_task/modules/login/data/dto/login_dto.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';
import 'package:kro_trust_task/modules/login/domain/usecases/login_usecase.dart';
import 'package:kro_trust_task/modules/login/presentation/form/login_form.dart';

part 'login_event.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, BaseBlocState<LoginResponse>> {
  final LoginUsecase _loginUsecase;

  final form = LoginForm();
  LoginBloc({LoginUsecase? loginUsecase})
      : _loginUsecase = loginUsecase ?? LoginUsecase.instance(),
        super(const BaseBlocState.init()) {
    on<LoginEvent>((event, emit) async {
      await event.map(
        login: (_) async {
          emit(const BaseBlocState.loading());
          final input = LoginDto(
            email: form.emailController.controller.text,
            password: form.passwordController.controller.text,
          );
          final result = await _loginUsecase.invoke(input);
          result.fold((l) => emit(BaseBlocState.error(l)), (r) {
            emit(BaseBlocState.next(r));
            form.clearForm();
          });
        },
        logout: (_) {},
      );
    });
  }
}
