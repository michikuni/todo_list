import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/constants/api_endpoints.dart';
import 'package:todo_list/core/error/exception.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';
import 'package:todo_list/data/datasources/remote/auth.dart';
import 'package:todo_list/data/models/auth/auth.dart';
import 'package:todo_list/data/models/auth/auth_response.dart';

@LazySingleton(as: AuthDatasource)
class AuthDatasourceImpl implements AuthDatasource {
  final Dio unTokenDio;
  final Dio tokenDio;
  final TokenStorage tokenStorage;
  AuthDatasourceImpl(
    @Named(ApiEndpoints.unTokenDioName) this.unTokenDio,
    @Named(ApiEndpoints.tokenDioName) this.tokenDio,
    this.tokenStorage,
  );

  @override
  Future<SignupResponseModel> signup(SignupModel auth) async {
    try {
      final response = await unTokenDio.post(
        ApiEndpoints.signupEndpoint,
        data: auth.toJson(auth),
      );
      return SignupResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NetworkException('No internet');
      }
      throw ServerException(
        e.response?.data['message'],
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<SigninResponseModel> signin(SigninModel auth) async {
    try {
      // print(auth.toJson(auth));
      final loginRes = await unTokenDio.post(
        ApiEndpoints.signinEndpoint,
        data: auth.toJson(auth),
      );
      await tokenStorage.saveAccessToken(loginRes.data['access_token']);
      await tokenStorage.saveRefreshToken(loginRes.data['refresh_token']);
      final response = await tokenDio.get(ApiEndpoints.profileEndpoint);
      await tokenStorage.saveUserId(
        SigninResponseModel.fromJson(response.data).id,
      );
      return SigninResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw NetworkException("Request timeout");
      }

      if (e.type == DioExceptionType.connectionError) {
        throw NetworkException("No Internet connection");
      }

      throw ServerException(
        e.response?.data is Map
            ? e.response?.data['message']
            : e.response?.data?.toString() ?? "Server error",
        statusCode: e.response?.statusCode,
      );
    }
  }
}
