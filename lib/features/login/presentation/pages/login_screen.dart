import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/core/widgets/app_text_button.dart';
import 'package:doctor_app/core/widgets/app_text_form_field.dart';
import 'package:doctor_app/features/login/presentation/pages/widgets/already_have_account.dart';
import 'package:doctor_app/features/login/presentation/pages/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TTextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TTextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Form(
                  child: Column(
                    children: [
                      const AppTextFormField(hintText: 'Email'),
                      verticalSpace(16),
                      AppTextFormField(
                        hintText: 'Password',
                        isObsecureText: true,
                        suffixIcon: GestureDetector(
                            onTap: () {}, child: const Icon(Icons.visibility)),
                      ),
                      verticalSpace(16),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot password?',
                          style: TTextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpace(32),
                      AppTextButton(
                        buttonText: 'Login',
                        textStyle: TTextStyles.font16WhiteSemiBold,
                        onPressed: () {},
                      ),
                      verticalSpace(25),
                      const TermsAndConditionsText(),
                      verticalSpace(40),
                      const AlreadyHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}