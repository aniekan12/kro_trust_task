import 'package:kro_resources/common/io/resource.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:kro_trust_task/modules/login/data/datasource/user_datasource.dart';
import 'package:kro_trust_task/modules/login/data/dto/login_dto.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';

class UserRepository with NetworkBoundResource {
  UserRepository({UserDataSource? userDatasource})
      : _userDatasource = userDatasource ?? locator<UserDataSource>();
  final UserDataSource _userDatasource;

  factory UserRepository.instance() => locator<UserRepository>();

  Resource<LoginResponse?> login({required LoginDto loginDto}) {
    return networkBoundResource(
      fromLocal: Stream.empty,
      fromRemote: () => _userDatasource.login(dto: loginDto),
    );
  }
}
