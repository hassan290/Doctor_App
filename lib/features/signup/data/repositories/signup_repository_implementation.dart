import 'package:doctor_app/core/networking/api_error_handler/api_error_handler.dart';
import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/core/networking/api_service.dart';
import 'package:doctor_app/features/signup/data/data_sources/models/signup_request_body.dart';
import 'package:doctor_app/features/signup/data/data_sources/models/signup_response.dart';
import 'package:doctor_app/features/signup/domain/repositories/signup_repository.dart';

class SignupRepositoryImp implements SignupRepository {
  final ApiService _apiService;

  SignupRepositoryImp(this._apiService);
  @override
  Future<ApiResult<SignUpResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
