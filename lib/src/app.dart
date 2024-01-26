import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/src/core/dependency_injection/service_locator.dart';
import 'package:task/src/core/theme/apptheme.dart';
import 'package:task/src/features/login/presentation/cubit/token_cubit/token_cubit.dart';
import 'package:task/src/features/login/presentation/cubit/token_cubit/token_state.dart';
import 'package:task/src/features/login/presentation/pages/login_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true, 
      builder: (context, child) => BlocProvider.value(
        value: sl<TokenCubit>(),
        child: Builder(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.generate("poppins", context),
            home: BlocListener<TokenCubit, TokenState>(
              listener: (context, state) {
                if (state is TokenExpired) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Your Token has been expired ")),
                  );
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                }
              },
              child: const LoginScreen(),
            ),
          );
        }),
      ),
    );
  }
}
