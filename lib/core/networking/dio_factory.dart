import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  Future<Dio> getDio(String baseUrl) async {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: 3000),
        receiveTimeout: const Duration(milliseconds: 3000),
        sendTimeout: const Duration(milliseconds: 3000),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '',
        },
      );
    dio.interceptors.addAll(
      [
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      ],
    );
    return dio;
  }
}

class DioFactoryClient {
  DioFactoryClient._();
  static Dio? dio;
  static Dio getDio() {
    Duration timeout = const Duration(milliseconds: 3000);
    if (dio == null) {
      dio = Dio();
      dio!.options
        ..connectTimeout = timeout
        ..receiveTimeout = timeout
        ..sendTimeout = timeout
        ..headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        };
      addDioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }
}
