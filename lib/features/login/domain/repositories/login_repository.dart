import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/features/login/data/remote/models/login_request_body.dart';
import 'package:doctor_app/features/login/data/remote/models/login_response.dart';

abstract class LoginRepository {
  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody);
}
