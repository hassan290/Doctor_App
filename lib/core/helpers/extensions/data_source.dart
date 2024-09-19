import 'package:doctor_app/core/networking/api_error_handler/api_data_source.dart';
import 'package:doctor_app/core/networking/api_error_handler/api_response_code.dart';
import 'package:doctor_app/core/networking/api_error_handler/api_response_message.dart';
import 'package:doctor_app/core/networking/api_error_model.dart';

extension ApiDataSourceExtension on ApiDataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case ApiDataSource.noContent:
        return ApiErrorModel(
            message: ApiResponseMessage.noContent,
            code: ApiResponseCode.noContent);
      case ApiDataSource.badRequest:
        return ApiErrorModel(
            message: ApiResponseMessage.badRequest,
            code: ApiResponseCode.badRequest);
      case ApiDataSource.forbidden:
        return ApiErrorModel(
            message: ApiResponseMessage.forbidden,
            code: ApiResponseCode.forbidden);
      case ApiDataSource.unAutorised:
        return ApiErrorModel(
            message: ApiResponseMessage.unAutorised,
            code: ApiResponseCode.unAutorised);
      case ApiDataSource.notFound:
        return ApiErrorModel(
            message: ApiResponseMessage.notFound,
            code: ApiResponseCode.notFound);
      case ApiDataSource.internalServerError:
        return ApiErrorModel(
            message: ApiResponseMessage.internalServerError,
            code: ApiResponseCode.internalServerError);
      case ApiDataSource.connectTimeout:
        return ApiErrorModel(
            message: ApiResponseMessage.timeout,
            code: ApiResponseCode.connectTimeout);
      case ApiDataSource.cancel:
        return ApiErrorModel(
            message: ApiResponseMessage.cancel, code: ApiResponseCode.cancel);
      case ApiDataSource.recieveTimeout:
        return ApiErrorModel(
            message: ApiResponseMessage.timeout,
            code: ApiResponseCode.recieveTimeout);
      case ApiDataSource.sendTimeout:
        return ApiErrorModel(
            message: ApiResponseMessage.timeout,
            code: ApiResponseCode.sendTimeout);
      case ApiDataSource.cacheError:
        return ApiErrorModel(
            message: ApiResponseMessage.cacheError,
            code: ApiResponseCode.cacheError);
      case ApiDataSource.noInternetConnection:
        return ApiErrorModel(
            message: ApiResponseMessage.noInternetConnection,
            code: ApiResponseCode.noInternetConnection);
      case ApiDataSource.defaultError:
        return ApiErrorModel(
            message: ApiResponseMessage.defaultError,
            code: ApiResponseCode.defaultError);
    }
  }
}
