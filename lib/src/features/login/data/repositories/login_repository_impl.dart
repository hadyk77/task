import 'package:dartz/dartz.dart';
import 'package:task/src/core/exceptions/failure.dart';
import 'package:task/src/core/helpers/dartz_handler.dart';
import 'package:task/src/features/login/data/datasources/login_datasource.dart';
import 'package:task/src/features/login/domain/entities/user.dart';
import 'package:task/src/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository with DartzHandler {
  final LoginDatasource _datasource;

  LoginRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) {
    return eitherHandler(
        () => _datasource.login(email: email, password: password));
  }

  @override
  Future<Either<Failure, String>> refreshToken(String refreshToken) {
    return eitherHandler(
        () => _datasource.refreshToken(refreshToken: refreshToken));
  }
}
