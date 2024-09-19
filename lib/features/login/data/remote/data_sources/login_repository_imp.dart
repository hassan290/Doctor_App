import 'package:doctor_app/core/networking/api_error_handler/api_error_handler.dart';
import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/core/networking/api_service.dart';
import 'package:doctor_app/features/login/data/remote/models/login_request_body.dart';
import 'package:doctor_app/features/login/data/remote/models/login_response.dart';
import 'package:doctor_app/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  final ApiService _apiService;
  LoginRepositoryImp(this._apiService);
  @override
  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

}
