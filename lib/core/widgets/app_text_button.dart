import 'package:doctor_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const AppTextButton({super.key, this.borderRadius, this.backgroundColor, this.verticalPadding, this.horizontalPadding, this.buttonWidth, this.buttonHeight, required this.buttonText, required this.textStyle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius?? 16.r),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(backgroundColor ?? TColors.mainBlue),
        padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: horizontalPadding?.w ?? 12.w, vertical: verticalPadding?.h ?? 14.h)),
        fixedSize: WidgetStatePropertyAll(Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.h)),
      ),
      child: Text(buttonText, style: textStyle),
    );
  }
}
