import 'package:flutter/material.dart';
import 'package:task/src/core/dependency_injection/service_locator.dart';
import 'package:task/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:task/src/features/login/presentation/pages/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Welcome ${loggedInUser!.firstName} ${loggedInUser!.lastName}"),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              child: const Text("logout"),
            ),
            TextButton(
              onPressed: () {
                sl<HomeCubit>().get();
              },
              child: const Text("Tap this button to verify token refresh"),
            )
          ],
        ),
      ),
    );
  }
}
