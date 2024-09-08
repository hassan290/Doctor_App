import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObsecureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObsecureText,
    this.suffixIcon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: TColors.lighterGray, width: 1.3),
                  borderRadius: BorderRadius.circular(16.r)),
          focusedBorder: focusBorder ??
              OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: TColors.mainBlue, width: 1.3),
                  borderRadius: BorderRadius.circular(16.r)),
          hintStyle: hintStyle ?? TTextStyles.font13GrayRegular,
          hintText: hintText,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: backgroundColor ?? TColors.moreGray),
      obscureText: isObsecureText ?? false,
      style: TTextStyles.font14DarkBlueMedium,
    );
  }
}
