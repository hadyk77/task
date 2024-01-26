import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/src/core/theme/colors.dart';

class FontStyles {
  static TextStyle get hintStyle => TextStyle(
        fontSize: 10.sp,
        color: Colors.grey[600],
      );

  static TextStyle get labelStyle => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor,
      );
  static TextStyle get buttons => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
  static TextStyle get textButtons => FontStyles.hintStyle.copyWith(
        color: AppColors.primaryColor,
        fontSize: 12.sp,
      );
}
