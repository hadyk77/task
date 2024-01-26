import 'package:dartz/dartz.dart';
import 'package:task/src/core/exceptions/failure.dart';
import 'package:task/src/core/helpers/dartz_handler.dart';
import 'package:task/src/features/home/data/datasources/home_datasource.dart';
import 'package:task/src/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository with DartzHandler {
  final HomeDatasource _datasource;

  HomeRepositoryImpl(this._datasource);

  @override
  Future<Option<Failure>> get() async {
    return optionHandler(() => _datasource.getHomeData());
  }
}
