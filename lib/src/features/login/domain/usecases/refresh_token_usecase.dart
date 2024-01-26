import 'package:dartz/dartz.dart';
import 'package:task/src/core/exceptions/failure.dart';
import 'package:task/src/features/login/domain/repositories/login_repository.dart';

class RefreshTokenUsecase {
  final LoginRepository repository;

  RefreshTokenUsecase(this.repository);

  Future<Either<Failure, String>> call(String refreshToken) async {
    return await repository.refreshToken(refreshToken);
  }
}
