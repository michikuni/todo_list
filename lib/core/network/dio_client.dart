import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/constants/api_endpoints.dart';

@module
abstract class DioClient {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }
}
