import 'package:todo_list/data/models/profile/profile_response.dart';

abstract class IProfileDataSource{
  Future<ProfileResponseModel> profile();
}