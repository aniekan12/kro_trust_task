import 'package:kro_trust_task/core/mocks/mock_responses.dart';
import 'package:kro_trust_task/modules/login/data/dto/login_dto.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';
import 'package:kro_trust_task/utils/future_extensions.dart';

import 'user_datasource.dart';

class UserDataSourceImpl extends UserDataSource {
  @override
  Future<LoginResponse> login({required LoginDto dto}) async {
    try {
      if (dto.email == 'akpakpan764@gmail.com' &&
          dto.password == 'Password123') {
        await delay(5.seconds);
        final loginResponse = LoginResponse.fromJson(loginResonse);
        return loginResponse;
      } else {
        throw KroException.fromMessage('Invalid Credentials');
      }
    } catch (e) {
      throw KroException.fromMessage('Invalid Credentials!');
    }
  }
}
