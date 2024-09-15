import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/core/validators/validators.dart';
import 'package:doctor_app/core/widgets/app_text_button.dart';
import 'package:doctor_app/core/widgets/app_text_form_field.dart';
import 'package:doctor_app/features/login/data/remote/models/login_request_body.dart';
import 'package:doctor_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:doctor_app/features/login/presentation/manager/cubit/login_state.dart';
import 'package:doctor_app/features/login/presentation/pages/widgets/already_have_account.dart';
import 'package:doctor_app/features/login/presentation/pages/widgets/login_bloc_listener.dart';
import 'package:doctor_app/features/login/presentation/pages/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LoginCubit>();

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
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        hintText: 'Email',
                        controller: controller.emailController,
                        validator: AppValidator.validateEmail,
                      ),
                      verticalSpace(16),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return AppTextFormField(
                            hintText: 'Password',
                            controller: controller.passwordController,
                            isObsecureText: controller.isObsecure,
                            validator: AppValidator.validatePassword,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.changeObscure();
                              },
                              child: controller.isObsecure
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                          );
                        },
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
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.emitLoginStates(LoginRequestBody(
                                email: controller.emailController.text,
                                password: controller.passwordController.text));
                          }
                        },
                      ),
                      verticalSpace(25),
                      const TermsAndConditionsText(),
                      verticalSpace(40),
                      const AlreadyHaveAccountText(),
                      const LoginBlocListener(),
                      
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
