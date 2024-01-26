part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class ChangePasswordVisibility extends LoginState {}

class LoginFailed extends LoginState {
  final Failure failure;

  LoginFailed(this.failure);
}
