import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/features/login/presentation/pages/widgets/terms_and_conditions.dart';
import 'package:doctor_app/features/signup/presentation/widgets/have_account_text.dart';
import 'package:doctor_app/features/signup/presentation/widgets/signup_bloc_listener.dart';
import 'package:doctor_app/features/signup/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller=context.read<SignupCubit>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TTextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TTextStyles.font14GrayRegular,
                ),
                verticalSpace(20),
                const SignupForm(),
                verticalSpace(25),
                Column(
                  children: [
                    const TermsAndConditionsText(),
                    verticalSpace(40),
                    const HaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
