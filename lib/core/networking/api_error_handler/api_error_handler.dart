import 'package:dio/dio.dart';
import 'package:doctor_app/core/helpers/extensions/data_source.dart';
import 'package:doctor_app/core/networking/api_error_handler/api_data_source.dart';
import 'package:doctor_app/core/networking/api_error_model.dart';

class ApiErrorHandler implements Exception {
  late ApiErrorModel failure;
  ApiErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = ApiDataSource.defaultError.getFailure();
    }
  }

  ApiErrorModel _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiDataSource.connectTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return ApiDataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return ApiDataSource.recieveTimeout.getFailure();
      case DioExceptionType.badCertificate:
        return ApiDataSource.defaultError.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return ApiErrorModel.fromJson(error.response!.data);
        } else {
          return ApiDataSource.defaultError.getFailure();
        }
      case DioExceptionType.cancel:
        return ApiDataSource.cancel.getFailure();
      case DioExceptionType.connectionError:
        return ApiDataSource.defaultError.getFailure();
      case DioExceptionType.unknown:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return ApiErrorModel.fromJson(error.response!.data);
        } else {
          return ApiDataSource.defaultError.getFailure();
        }
    }
  }
}
