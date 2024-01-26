import 'package:bloc/bloc.dart';
import 'package:task/src/core/dependency_injection/service_locator.dart';
import 'package:task/src/core/exceptions/failure.dart';
import 'package:task/src/features/login/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUsecase) : super(LoginInitial());
  final LoginUsecase _loginUsecase;
  String email = '', password = "";
  bool passwordVisible = false;
  Future<void> login() async {
    emit(LoginLoading());
    final result = await _loginUsecase(email: email, password: password);
    result.fold((l) {
      emit(LoginFailed(l));
    }, (r) {
      loggedInUser = r;
      emit(LoginSuccess());
    });
  }

  void changeEmail(String value) {
    email = value;
  }

  void changePassword(String value) {
    password = value;
  }

  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
    emit(ChangePasswordVisibility());
  }
}
