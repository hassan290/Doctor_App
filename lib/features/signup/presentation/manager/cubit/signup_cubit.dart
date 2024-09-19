import 'package:doctor_app/features/signup/data/data_sources/models/signup_request_body.dart';
import 'package:doctor_app/features/signup/domain/use_cases/signup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_app/features/signup/presentation/manager/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUsecase _signupUsecase;
  SignupCubit(this._signupUsecase) : super(const SignupState.initial());

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  void emitSignupStates(SignupRequestBody signupRequestBody) async {
    emit(const SignupState.loading());
    final response = await _signupUsecase.call(signupRequestBody);
    response.when(
      success: (signupResponse) => emit(SignupState.success(signupResponse)),
      failure: (error) => emit(SignupState.error(message: error.failure.message ?? '')),
    );
  }
}
