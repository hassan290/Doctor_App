import 'package:doctor_app/core/helpers/extensions/navigation.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/features/signup/presentation/manager/cubit/signup_cubit.dart';
import 'package:doctor_app/features/signup/presentation/manager/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
            loading: () {
              // show loading
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: TColors.mainBlue,
                  ),
                ),
              );
            },
            success: (signupResponse) {
              context.pop();
              context.pushNamed(Routes.login);
            },
            error: (error) {
              setUpErrorState(context, error);
            },);
      },
      child: const SizedBox.shrink(),
    );
  }
}


void setUpErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(
          error,
          style: TTextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Got it',
              style: TTextStyles.font14BlueSemiBold,
            ),
          )
        ],
      ),
    );
  }