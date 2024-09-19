import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/core/validators/validators.dart';
import 'package:doctor_app/core/widgets/app_text_button.dart';
import 'package:doctor_app/core/widgets/app_text_form_field.dart';
import 'package:doctor_app/features/signup/data/data_sources/models/signup_request_body.dart';
import 'package:doctor_app/features/signup/presentation/manager/cubit/signup_cubit.dart';
import 'package:doctor_app/features/signup/presentation/widgets/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SignupCubit>();
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: AppValidator.validateEmptyText,
            controller: controller.nameController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Email',
            validator: AppValidator.validateEmail,
            controller: controller.emailController,
          ),
          verticalSpace(16),
          const PhoneNumberField(),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Password',
            isObsecureText: true,
            validator: AppValidator.validatePassword,
            controller: controller.passwordController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Confirm Password',
            isObsecureText: true,
            validator: AppValidator.validatePassword,
            controller: controller.confirmPasswordController,
          ),
          verticalSpace(32),
          AppTextButton(
            buttonText: 'Create Account',
            textStyle: TTextStyles.font16WhiteSemiBold,
            onPressed: () {
              if (controller.formKey.currentState!.validate()) {
                controller.emitSignupStates(SignupRequestBody(name: controller.nameController.text, email: controller.emailController.text, phone: controller.phoneNumberController.text, password: controller.passwordController.text, passwordConfirmation: controller.confirmPasswordController.text, gender: 0));
              } 
            },
          ),
        ],
      ),
    );
  }
}
