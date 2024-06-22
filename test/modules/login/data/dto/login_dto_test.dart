import 'package:flutter_test/flutter_test.dart';
import 'package:kro_trust_task/modules/login/data/dto/login_dto.dart';

void main() {
  group('LoginDto', () {
    test('props should return correct values', () {
      const dto = LoginDto(email: 'test@example.com', password: 'password');
      expect(dto.props, equals(['test@example.com', 'password']));
    });
  });
}
