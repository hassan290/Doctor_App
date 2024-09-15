import 'package:doctor_app/core/networking/api_error_handler/api_errors.dart';

class ApiResponseMessage {
  static const String badRequest = ApiErrors.badRequestError;
  static const String noContent = ApiErrors.noContent;
  static const String forbidden = ApiErrors.forbiddenError;
  static const String unAutorised = ApiErrors.unauthorizedError;
  static const String notFound = ApiErrors.notFoundError;
  static const String conflictError = ApiErrors.conflictError;
  static const String internalServerError = ApiErrors.internalServerError;
  static const String unknownError = ApiErrors.unknownError;
  static const String timeout = ApiErrors.timeoutError;
  static const String cacheError = ApiErrors.cacheError;
  static const String noInternetConnection = ApiErrors.noInternetError;
  static const String loadingMessage = ApiErrors.loadingMessage;
  static const String retryAgainMessage = ApiErrors.retryAgainMessage;
  static const String ok = ApiErrors.ok;
  static const String cancel = ApiErrors.cancel;
  static const String defaultError = ApiErrors.defaultError;

}
