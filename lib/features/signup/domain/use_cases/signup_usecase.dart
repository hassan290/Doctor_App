import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/features/signup/data/data_sources/models/signup_request_body.dart';
import 'package:doctor_app/features/signup/data/data_sources/models/signup_response.dart';
import 'package:doctor_app/features/signup/domain/repositories/signup_repository.dart';

class SignupUsecase {

  final SignupRepository _signupRepository;

  SignupUsecase(this._signupRepository);

  Future<ApiResult<SignUpResponse>> call(SignupRequestBody signupRequestBody) async {
    return await _signupRepository.signup(signupRequestBody);
  }
  
}