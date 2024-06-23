import 'package:flutter_test/flutter_test.dart';
import 'package:kro_trust_task/modules/login/data/datasource/user_datasource.dart';
import 'package:kro_trust_task/modules/login/data/dto/login_dto.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../core/mock_data.dart';
import 'user_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserDataSource>()])
void main() {
  group('UserDataSource', () {
    late UserDataSource dataSource;

    setUp(() {
      dataSource = MockUserDataSource();
    });

    test('login should call the correct method', () async {
      const dto = LoginDto(email: 'test@example.com', password: 'password');
      final response = LoginResponse.fromJson(mockLoginReponse);

      when(dataSource.login(dto: dto)).thenAnswer((_) async => response);

      final result = await dataSource.login(dto: dto);

      expect(result, response);
      verify(dataSource.login(dto: dto)).called(1);
    });
  });
}
