import 'package:kro_trust_task/modules/login/data/dto/login_dto.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';

abstract class UserDataSource {
  Future<LoginResponse> login({required LoginDto dto});
}
