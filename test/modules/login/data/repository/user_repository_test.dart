import 'package:flutter_test/flutter_test.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/modules/login/data/datasource/user_datasource.dart';
import 'package:kro_trust_task/modules/login/data/dto/login_dto.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';
import 'package:kro_trust_task/modules/login/data/repository/user_repository.dart';
import 'package:kro_trust_task/modules/login/domain/repository/user_repository_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/navigation/mock_data.dart';
import '../datasource/user_datasource_test.mocks.dart';

void main() {
  late UserDataSource userDataSource;
  late UserRepository userRepository;
  setUp(() {
    userDataSource = MockUserDataSource();
    userRepository = UserRepositoryImpl(userDataSource: userDataSource);
  });
  group('user repository', () {
    test('should return login response', () async {
      const dto =
          LoginDto(email: 'akpakpan764@gmail.com', password: 'Password123');
      final response = LoginResponse.fromJson(mockLoginReponse);

      when(userDataSource.login(dto: dto)).thenAnswer((_) async => response);
      final res = await userRepository.login(dto);
      res.fold(
        (l) => expect(l, isA<KroException>()),
        (r) => expect(r, isA<LoginResponse>()),
      );
    });
  });
}
