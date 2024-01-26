import 'package:flutter/material.dart';
import 'package:task/src/core/theme/font_style.dart';

class FastLoginOrSignUpWidget extends StatelessWidget {
  const FastLoginOrSignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Fast Login",
            style: FontStyles.textButtons,
          ),
        ),
        const Text(
          "OR",
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign Up",
            style: FontStyles.textButtons,
          ),
        ),
      ],
    );
  }
}
