import 'package:todo_list/data/models/auth/auth.dart';
import 'package:todo_list/data/models/auth/auth_response.dart';

abstract class AuthDatasource{
  Future<SignupResponseModel> signup (SignupModel auth);
  Future<SigninResponseModel> signin (SigninModel auth);
}
