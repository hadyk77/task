import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/src/core/dependency_injection/service_locator.dart';
import 'package:task/src/core/theme/colors.dart';
import 'package:task/src/core/ui_utils/validations.dart';
import 'package:task/src/core/widgets/text_field_widget.dart';
import 'package:task/src/features/login/presentation/cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final Validations validation = sl<Validations>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h, bottom: 20),
            child: TextFieldWidget(
              onChanged: (value) {
                context.read<LoginCubit>().changeEmail(value);
              },
              validator: validation.validateEmail,
              label: "Email",
              hint: "Enter Your Email",
            ),
          ),
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) =>
                current is ChangePasswordVisibility,
            builder: (context, state) {
              final cubit = context.read<LoginCubit>();
              return TextFieldWidget(
                  onChanged: (value) {
                    context.read<LoginCubit>().changePassword(value);
                  },
                  isPassword: !cubit.passwordVisible,
                  validator: validation.validatePassword,
                  label: "Password",
                  hint: "Enter Your Password",
                  suffix: InkWell(
                    onTap: () {
                      cubit.togglePasswordVisibility();
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: !cubit.passwordVisible
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey,
                            )
                          : Icon(
                              Icons.remove_red_eye_outlined,
                              color: AppColors.primaryColor,
                            ),
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
