import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/src/core/dependency_injection/service_locator.dart';
import 'package:task/src/core/theme/font_style.dart';
import 'package:task/src/core/widgets/button.dart';
import 'package:task/src/features/home/presentation/pages/home_screen.dart';
import 'package:task/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:task/src/features/login/presentation/widgets/fastlogin_or_signup_widget.dart';
import 'package:task/src/features/login/presentation/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final loginCubit = sl<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: loginCubit,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 150.h,
                    height: 150.h,
                  ),
                  LoginForm(formKey: formKey),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Your Password?",
                        style: FontStyles.textButtons,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.failure.message)),
                          );
                        }
                        if (state is LoginSuccess) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const HomeScreen()));
                        }
                      },
                      builder: (context, state) => ButtonWidget(
                        text: "Login",
                        loading: state is LoginLoading,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            loginCubit.login();
                          }
                        },
                      ),
                    ),
                  ),
                  const Spacer(),
                  const FastLoginOrSignUpWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
