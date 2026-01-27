import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/constants/api_endpoints.dart';
import 'package:todo_list/data/datasources/interceptor/token_interceptor.dart';

@module
abstract class DioClient {
  @Named(ApiEndpoints.tokenDioName)
  @lazySingleton
  Dio dio(TokenInterceptor tokenInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: ApiEndpoints.timeOut),
        receiveTimeout: const Duration(seconds: ApiEndpoints.timeOut),
      ),
    );
    dio.interceptors.add(tokenInterceptor);
    return dio;
  }

  @Named(ApiEndpoints.unTokenDioName)
  @lazySingleton
  Dio unTokenDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: ApiEndpoints.timeOut),
        receiveTimeout: const Duration(seconds: ApiEndpoints.timeOut),
      ),
    );
    // dio.interceptors.add(
    //   LogInterceptor(
    //     request: true,
    //     // requestBody: true,
    //     // responseBody: true,
    //     // responseHeader: true,
    //     // error: true,
    //   ),
    // );

    return dio;
  }

  @Named(ApiEndpoints.refreshDioName)
  @lazySingleton
  Dio refreshDio() => Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
}
