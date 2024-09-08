import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
              text: 'By logging, you agree to our ',
              style: TTextStyles.font13GrayRegular),
          TextSpan(
              text: 'Terms & Conditions ',
              style: TTextStyles.font13DarkBlueMedium),
          TextSpan(text: 'and ', style: TTextStyles.font13GrayRegular),
          TextSpan(
              text: 'Privacy Policy',
              style: TTextStyles.font13DarkBlueMedium.copyWith(height: 1.5)),
        ],
      ),
    );
  }
}
