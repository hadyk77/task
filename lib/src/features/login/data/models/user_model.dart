import 'package:task/src/features/login/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.accessToken,
    required super.refreshToken,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.role,
    required super.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    final userObj = map['user'];
    return UserModel(
      id: userObj['id'],
      accessToken: map['access_token'],
      refreshToken: map['refresh_token'],
      firstName: userObj['first_name'],
      lastName: userObj['last_name'],
      email: userObj['email'],
      phone: userObj['phone_number'],
      role: userObj['role'],
      gender: userObj['gender'],
    );
  }
}
