import 'package:doctor_app/core/helpers/extensions/navigation.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
              text: 'Don\'t have an account yet? ',
              style: TTextStyles.font13DarkBlueRegular),
          TextSpan(
            text: 'Sign Up',
            style: TTextStyles.font13BlueSemiBold
                .copyWith(color: TColors.mainBlue),
            recognizer: TapGestureRecognizer()..onTap = () => context.pushNamed(Routes.signup),
          ),
        ],
      ),
    );
  }
}
