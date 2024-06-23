import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:kro_resources/common/io/exceptions/kro_exceptions.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:kro_trust_task/modules/login/data/datasource/user_datasource.dart';
import 'package:kro_trust_task/modules/login/data/dto/login_dto.dart';
import 'package:kro_trust_task/modules/login/data/models/login_response.dart';
import 'package:kro_trust_task/modules/login/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl({UserDataSource? userDataSource})
      : _userDataSource = userDataSource ?? locator<UserDataSource>();

  @override
  Future<Either<KroException, LoginResponse>> login(LoginDto dto) async {
    try {
      final result = await _userDataSource.login(dto: dto);
      return Right(result);
    } on KroException catch (e) {
      return Left(KroException(
          statusCode: e.statusCode,
          message: e.message,
          description: e.description,
          cause: e.cause));
    }
  }
}
