import 'package:doctor_app/core/helpers/extensions/navigation.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.login);
      },
      style: ButtonStyle(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r))),
          backgroundColor: WidgetStateProperty.all(TColors.mainBlue),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStateProperty.all(Size(double.infinity, 50.h))),
      child: Text(
        'Get Started',
        style: TTextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
