import 'package:doctor_app/features/login/data/remote/models/login_request_body.dart';
import 'package:doctor_app/features/login/domain/use_cases/login_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_app/features/login/presentation/manager/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _loginUsecase;
  LoginCubit(this._loginUsecase) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());

    final response = await _loginUsecase.call(loginRequestBody);
    response.when(
      success: (loginResponse) => emit(LoginState.success(loginResponse)),
      failure: (error) =>
          emit(LoginState.error(message: error.failure.message ?? '')),
    );
  }

  void changeObscure() {
    isObsecure = !isObsecure;
    emit(LoginState.changeVisibility(isObsecure));
  }
}
