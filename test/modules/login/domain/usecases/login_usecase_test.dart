import 'package:flutter_test/flutter_test.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/modules/login/data/datasource/user_datasource.dart';
import 'package:kro_trust_task/modules/login/data/dto/login_dto.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';
import 'package:kro_trust_task/modules/login/data/repository/user_repository.dart';
import 'package:kro_trust_task/modules/login/domain/repository/user_repository_impl.dart';
import 'package:kro_trust_task/modules/login/domain/usecases/login_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/mock_data.dart';
import '../../data/datasource/user_datasource_test.mocks.dart';

void main() async {
  late UserDataSource apiDataSource;
  late UserRepository repository;
  late LoginUsecase useCase;
  setUp(() {
    apiDataSource = MockUserDataSource();
    repository = UserRepositoryImpl(userDataSource: apiDataSource);
    useCase = LoginUsecase(userRepository: repository);
  });

  test('should verify login is successful', () async {
    const dto =
        LoginDto(email: 'akpakpan764@gmail.com', password: 'Password123');
    when(apiDataSource.login(dto: dto))
        .thenAnswer((_) async => LoginResponse.fromJson(mockLoginReponse));

    final res = await useCase.invoke(dto);
    res.fold(
      (l) => expect(l, isA<KroException>()),
      (r) => expect(r, isA<LoginResponse>()),
    );
    verify(apiDataSource.login(dto: dto)).called(1);
  });
}
