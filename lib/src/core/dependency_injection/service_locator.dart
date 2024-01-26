import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:task/src/core/services/networking/dio_service.dart';
import 'package:task/src/core/services/networking/interceptors/header_interceptor.dart';
import 'package:task/src/core/services/networking/interceptors/response_validation_interceptor.dart';
import 'package:task/src/core/services/networking/interceptors/token_validation_interceptor.dart';
import 'package:task/src/core/services/networking/network_service.dart';
import 'package:task/src/core/ui_utils/validations.dart';
import 'package:task/src/features/home/data/datasources/home_datasource.dart';
import 'package:task/src/features/home/data/datasources/remote_home_datasource.dart';
import 'package:task/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:task/src/features/home/domain/repositories/home_repository.dart';
import 'package:task/src/features/home/domain/usecases/get_home_usecase.dart';
import 'package:task/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:task/src/features/login/data/datasources/login_datasource.dart';
import 'package:task/src/features/login/data/datasources/remote_login_datasource.dart';
import 'package:task/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:task/src/features/login/domain/entities/user.dart';
import 'package:task/src/features/login/domain/repositories/login_repository.dart';
import 'package:task/src/features/login/domain/usecases/login_usecase.dart';
import 'package:task/src/features/login/domain/usecases/refresh_token_usecase.dart';
import 'package:task/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:task/src/features/login/presentation/cubit/token_cubit/token_cubit.dart';

final GetIt sl = GetIt.instance;
User? loggedInUser;
Future<void> setup() async {
  //! core
  sl.registerFactory(() => Validations());
  //! services

  sl.registerLazySingleton<NetworkService>(() => DioService(sl()));

  //! packages
  await dotenv.load();
  sl.registerFactory(() => Dio()
    ..interceptors.addAll(
      [
        TokenValidationInterceptor(),
        HeaderInterceptor(),
        ResponseValidationInterceptor()
      ],
    ));

  //! login
  sl.registerFactory<LoginDatasource>(() => RemoteLoginDatasource(sl()));
  sl.registerFactory<LoginRepository>(() => LoginRepositoryImpl(sl()));
  sl.registerFactory(() => LoginUsecase(sl()));
  sl.registerFactory(() => RefreshTokenUsecase(sl()));
  sl.registerFactory(() => LoginCubit(sl()));

  //! token

  sl.registerLazySingleton(() => TokenCubit(sl()));

  //! home
  sl.registerFactory<HomeDatasource>(() => RemoteHomeDatasource(sl()));
  sl.registerFactory<HomeRepository>(() => HomeRepositoryImpl(sl()));
  sl.registerFactory(() => GetHomeUsecase(sl()));
  sl.registerFactory(() => HomeCubit(sl()));
}
