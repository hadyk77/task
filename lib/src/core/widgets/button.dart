import 'package:flutter/material.dart';
import 'package:task/src/core/theme/colors.dart';
import 'package:task/src/core/theme/font_style.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onPressed,
    this.color,
    this.text,
    this.textColor = Colors.white,
    this.height,
    this.width,
    this.child,
    this.borderColor,
    this.hasElevation = false,
    this.loading = false,
    this.loadingColor,
    this.borderRadius = 10,
    this.fontStyle,
  }) : assert(child != null || text != null);
  final Function()? onPressed;
  final Color? color;
  final String? text;
  final double? height;
  final double? width;
  final Widget? child;
  final Color? borderColor;
  final Color textColor;
  final bool hasElevation;
  final bool loading;
  final Color? loadingColor;
  final double borderRadius;
  final TextStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 49,
      child: MaterialButton(
        onPressed: onPressed,
        color: color ?? AppColors.primaryColor,
        minWidth: width ?? MediaQuery.sizeOf(context).width,
        height: height ?? 49,
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: borderColor != null
              ? BorderSide(
                  color: borderColor!,
                )
              : BorderSide.none,
        ),
        elevation: 0,
        splashColor: color,
        focusColor: color,
        highlightColor: color,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: loading
            ? SizedBox(
                width: height,
                height: height,
                child: Center(
                  child: CircularProgressIndicator(
                    color: loadingColor ?? Colors.white,
                  ),
                ),
              )
            : text != null
                ? Text(
                    text!,
                    style: fontStyle ??
                        FontStyles.buttons.copyWith(
                          color: textColor,
                        ),
                  )
                : child,
      ),
    );
  }
}
