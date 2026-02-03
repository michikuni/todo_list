import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/constants/api_endpoints.dart';
import 'package:todo_list/core/error/exception.dart';
import 'package:todo_list/data/datasources/remote/profile/profile.dart';
import 'package:todo_list/data/models/profile/profile_response.dart';

@LazySingleton(as: IProfileDataSource)
class ProfileDatasourceImpl extends IProfileDataSource {
  final Dio dio;
  ProfileDatasourceImpl(@Named(ApiEndpoints.tokenDioName) this.dio);
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
}
