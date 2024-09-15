import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/features/login/data/remote/models/login_request_body.dart';
import 'package:doctor_app/features/login/data/remote/models/login_response.dart';
import 'package:doctor_app/features/login/domain/repositories/login_repository.dart';

class LoginUsecase {
  final LoginRepository _loginRepository;

  LoginUsecase(this._loginRepository);

  Future<ApiResult<LoginResponse>> call(LoginRequestBody loginRequestBody) async {
    return await _loginRepository.login(loginRequestBody);
  }
}
