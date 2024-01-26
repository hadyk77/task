import 'package:dartz/dartz.dart';
import 'package:task/src/core/exceptions/exceptions.dart';
import 'package:task/src/core/exceptions/failure.dart';

mixin DartzHandler {
  Future<Either<Failure, T>> eitherHandler<T>(
      Future<T> Function() callback) async {
    try {
      final result = await callback();
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message, e.errors));
    }
  }

  Future<Option<Failure>> optionHandler<T>(
      Future<T> Function() callback) async {
    try {
      await callback();
      return none();
    } on ServerException catch (e) {
      return some(ServerFailure(e.message, e.errors));
    }
  }
}
