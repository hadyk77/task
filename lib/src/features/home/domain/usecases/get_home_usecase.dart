import 'package:dartz/dartz.dart';
import 'package:task/src/core/exceptions/failure.dart';
import 'package:task/src/features/home/domain/repositories/home_repository.dart';

class GetHomeUsecase {
  final HomeRepository _repository;

  GetHomeUsecase(this._repository);

  Future<Option<Failure>> call() => _repository.get();
}
