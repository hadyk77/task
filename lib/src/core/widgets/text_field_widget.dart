import 'package:flutter/material.dart';
import 'package:task/src/core/theme/colors.dart';
import 'package:task/src/core/theme/font_style.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.onChanged,
    this.validator,
    this.label,
    this.hint,
    this.suffix,
    this.isPassword = false,
  });
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final String? label;
  final String? hint;
  final Widget? suffix;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.greyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        labelText: label,
        labelStyle: FontStyles.labelStyle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hint,
        hintStyle: FontStyles.hintStyle,
        suffixIcon: suffix,
      ),
      obscureText: isPassword,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
