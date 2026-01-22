import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/constants/api_endpoints.dart';
import 'package:todo_list/core/error/exception.dart';
import 'package:todo_list/data/datasources/remote/auth.dart';
import 'package:todo_list/data/models/auth.dart';
import 'package:todo_list/data/models/auth_response.dart';

@LazySingleton(as: AuthDatasource)
class AuthDatasourceImpl implements AuthDatasource {
  final Dio dio;
  AuthDatasourceImpl(this.dio);

  @override
  Future<AuthResponseModel> signup(AuthModel auth) async {
    try {
      final response = await dio.post(
        ApiEndpoints.signupEndpoint,
        data: auth.toJson(auth),
      );
      return AuthResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if(e.type == DioExceptionType.connectionError){
        throw NetworkException('No internet');
      }
      throw ServerException(
        e.response?.data['message'],
        statusCode: e.response?.statusCode,
      );
    }
  }
}
