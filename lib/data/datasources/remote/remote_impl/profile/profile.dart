import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/constants/api_endpoints.dart';
import 'package:todo_list/core/constants/dio_name.dart';
import 'package:todo_list/core/error/exception.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';
import 'package:todo_list/data/datasources/remote/profile/profile.dart';
import 'package:todo_list/data/models/profile/profile_response.dart';

@LazySingleton(as: IProfileDataSource)
class ProfileDatasourceImpl extends IProfileDataSource {
  final Dio dio;
  final TokenStorage storage;
  ProfileDatasourceImpl(@Named(DioName.tokenDioName) this.dio, this.storage);
  @override
  Future<ProfileResponseModel> getProfile() async {
    try {
      final response = await dio.get(ApiEndpoints.profileEndpoint);
      return ProfileResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NetworkException('No Internet');
      }
      throw ServerException(
        e.response?.data is Map
            ? e.response?.data['message']
            : e.response?.data?.toString() ?? "Server error",
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<ProfileResponseModel> updateNameProfile(String name) async {
    try {
      final userId = await storage.getUserId();
      final response = await dio.put('${ApiEndpoints.userUpdateEndpoint}/$userId', data: {"name": name});
      return ProfileResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NetworkException('No Internet');
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
