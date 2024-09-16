import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/core/validators/validators.dart';
import 'package:doctor_app/features/signup/presentation/manager/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SignupCubit>();
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {},
      onInputValidated: (bool value) => AppValidator.validatePhoneNumber,
      textFieldController: controller.phoneNumberController,
      inputDecoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: TColors.lighterGray, width: 1.3),
            borderRadius: BorderRadius.circular(16.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: TColors.mainBlue, width: 1.3),
            borderRadius: BorderRadius.circular(16.r)),
        hintStyle: TTextStyles.font13GrayRegular,
        hintText: 'Phone number',
        suffixIcon: null,
        filled: true,
        fillColor: TColors.moreGray,
      ),
      countries: const ['US', 'GB', 'RU', 'SY'],
      spaceBetweenSelectorAndTextField: 0,
      selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DROPDOWN,
          trailingSpace: false,
          useEmoji: true),
      onSubmit: () {},
    );
  }
}
