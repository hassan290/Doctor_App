import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/features/signup/data/data_sources/models/signup_request_body.dart';
import 'package:doctor_app/features/signup/data/data_sources/models/signup_response.dart';

abstract class SignupRepository {
  Future<ApiResult<SignUpResponse>> signup(SignupRequestBody signupRequestBody);
}
