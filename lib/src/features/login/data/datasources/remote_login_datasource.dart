import 'dart:developer';

import 'package:task/src/core/services/networking/network_service.dart';
import 'package:task/src/features/login/data/datasources/login_datasource.dart';
import 'package:task/src/features/login/data/models/user_model.dart';

class RemoteLoginDatasource extends LoginDatasource {
  final NetworkService _service;

  RemoteLoginDatasource(this._service);

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await _service.post("/auth/login", data: {
      "email": email,
      "password": password,
    });
    final user = UserModel.fromJson(response.data['data'][0]);
    log(user.refreshToken);
    return user;
  }

  @override
  Future<String> refreshToken({required String refreshToken}) async {
    final response = await _service.post(
      "/auth/refresh",
      headers: {
        "Authorization": "Bearer $refreshToken",
        "is_refresh": true,
      },
    );

    return response.data['data']['access_token'];
  }
}
