import 'package:dartz/dartz.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:kro_trust_task/core/usecase/usecase.dart';
import 'package:kro_trust_task/modules/login/data/dto/login_dto.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';
import 'package:kro_trust_task/modules/login/data/repository/user_repository.dart';

class LoginUsecase extends UseCase<LoginDto, KroException, LoginResponse> {
  LoginUsecase({UserRepository? userRepository})
      : _repository = userRepository ?? locator<UserRepository>();

  factory LoginUsecase.instance() => locator<LoginUsecase>();

  final UserRepository _repository;

  @override
  Future<Either<KroException, LoginResponse>> invoke(LoginDto input) {
    return _repository.login(input);
  }
}
