import 'package:dartz/dartz.dart';
import 'package:task/src/core/exceptions/failure.dart';
import 'package:task/src/features/login/domain/entities/user.dart';
import 'package:task/src/features/login/domain/repositories/login_repository.dart';

class LoginUsecase {
  final LoginRepository _repository;

  LoginUsecase(this._repository);

  Future<Either<Failure, User>> call(
          {required String email, required String password}) =>
      _repository.login(email: email, password: password);
}
