import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';

@lazySingleton
class TokenInterceptor extends Interceptor {
  final Dio refreshDio;
  // final Dio tokenDio;
  final TokenStorage tokenStograge;

  TokenInterceptor(
    @Named('refreshDio') this.refreshDio,
    // @Named('tokenDio') this.tokenDio,
    this.tokenStograge,
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokenStograge.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) async {
  //   if (err.response?.statusCode == 401) {
  //     final refreshToken = await tokenStograge.getRefreshToken();
  //     if (refreshToken == null) {
  //       return handler.next(err);
  //     }

  //     final response = await refreshDio.post(
  //       ApiEndpoints.refreshTokenEndpoint,
  //       data: {'refreshToken': refreshToken},
  //     );

  //     final newAccessToken = response.data['access_token'];
  //     await tokenStograge.saveAccessToken(newAccessToken);

  //     final options = err.requestOptions;
  //     options.headers['Authorization'] = 'Bearer $newAccessToken';

  //     final retryResponse = await tokenDio.fetch(options);
  //     return handler.resolve(retryResponse);
  //   }

  //   handler.next(err);
  // }
}
