import 'package:dartz/dartz.dart';
import 'package:task/src/core/exceptions/failure.dart';

abstract class HomeRepository {
  Future<Option<Failure>> get();
}
