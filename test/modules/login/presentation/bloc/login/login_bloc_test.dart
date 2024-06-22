import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kro_trust_task/core/base/base_state.bloc.dart';
import 'package:kro_trust_task/modules/login/data/datasource/user_datasource.dart';
import 'package:kro_trust_task/modules/login/data/dto/login_dto.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';
import 'package:kro_trust_task/modules/login/data/repository/user_repository.dart';
import 'package:kro_trust_task/modules/login/domain/repository/user_repository_impl.dart';
import 'package:kro_trust_task/modules/login/domain/usecases/login_usecase.dart';
import 'package:kro_trust_task/modules/login/presentation/bloc/login/login_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../core/navigation/mock_data.dart';
import '../../../data/datasource/user_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LoginUsecase>()])
void main() {
  late UserDataSource userDataSource;
  late UserRepository userRepository;
  late LoginUsecase loginUsecase;
  setUpAll(() {
    userDataSource = MockUserDataSource();
    userRepository = UserRepositoryImpl(userDataSource: userDataSource);
    loginUsecase = LoginUsecase(userRepository: userRepository);

    const loginDto =
        LoginDto(email: 'akpakpan764@gmail.com', password: 'Password123');
    when(userDataSource.login(dto: loginDto))
        .thenAnswer((_) async => LoginResponse.fromJson(mockLoginReponse));
  });

  group('login bloc', () {
    blocTest<LoginBloc, BaseBlocState<LoginResponse>>(
        'emits login success when login event is added.',
        build: () => LoginBloc(loginUsecase: loginUsecase),
        act: (bloc) {
          const loginDto =
              LoginDto(email: 'akpakpan764@gmail.com', password: 'Password123');
          bloc.add(const LoginEvent.login(loginDto: loginDto));
        },
        expect: () => <BaseBlocState<LoginResponse>>[
              const BaseBlocState.loading(),
              BaseBlocState.next(LoginResponse.fromJson(mockLoginReponse))
            ]);
  });
}
