import 'package:dartz/dartz.dart';
import 'package:task/src/core/exceptions/failure.dart';
import 'package:task/src/features/login/domain/entities/user.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> login(
      {required String email, required String password});

  Future<Either<Failure, String>> refreshToken(String refreshToken);
}
