import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/constants/interceptor.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';

@lazySingleton
class TokenInterceptor extends Interceptor {
  final TokenStorage tokenStograge;

  TokenInterceptor(
    this.tokenStograge,
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokenStograge.getAccessToken();
    if (token != null) {
      options.headers[InterceptorConst.interceptorHeader] = '${InterceptorConst.interceptorTokenType} $token';
    }
    handler.next(options);
  }
}
