import 'package:flutter_test/flutter_test.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';

import '../../../../core/navigation/mock_data.dart';

void main() {
  group('LoginResponse', () {
    test('fromJson should create a valid LoginResponse object', () {
      final loginResponse = LoginResponse.fromJson(mockLoginReponse);

      expect(loginResponse.accessToken, 'eyhshsh92992002jsjsjsss');
      expect(loginResponse.userName, 'ani');
      expect(loginResponse.id, '939300');
      expect(loginResponse.savingsBalance, 100);
      expect(loginResponse.checkingsBalance, 200);
    });

    test('fromJson should handle null values', () {
      final loginResponse = LoginResponse.fromJson(nullMockLoginReponse);

      expect(loginResponse.accessToken, null);
      expect(loginResponse.userName, null);
      expect(loginResponse.id, null);
      expect(loginResponse.savingsBalance, null);
      expect(loginResponse.checkingsBalance, null);
    });
  });
}
