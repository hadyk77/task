import 'package:flutter/material.dart';
import 'package:task/src/core/theme/colors.dart';

class AppTheme {
  static generate(String fontFamily, BuildContext context) {
    return ThemeData(
      dialogTheme: const DialogTheme(
        surfaceTintColor: Colors.white,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      disabledColor: Colors.black,
      dividerTheme: const DividerThemeData(
        space: 1,
      ),
      textTheme: const TextTheme().apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
      
      buttonTheme: const ButtonThemeData(),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      fontFamily: fontFamily,
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.red,
      ).copyWith(background: Colors.white),
    );
  }
}
