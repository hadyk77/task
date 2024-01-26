import 'package:task/src/features/login/data/models/user_model.dart';

abstract class LoginDatasource {
  Future<UserModel> login({required String email, required String password});
  Future<String> refreshToken({required String refreshToken});
}
