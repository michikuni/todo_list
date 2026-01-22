import 'package:todo_list/data/models/auth.dart';
import 'package:todo_list/data/models/auth_response.dart';

abstract class AuthDatasource{
  Future<AuthResponseModel> signup (AuthModel auth);
}
