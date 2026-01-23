import 'package:todo_list/data/models/auth.dart';
import 'package:todo_list/data/models/auth_response.dart';
import 'package:todo_list/domain/entities/auth/auth.dart';
import 'package:todo_list/domain/entities/auth/auth_response.dart';

class AuthMapper {
  static SignupResponseEntity toSignupEntity(SignupResponseModel auth) {
    return SignupResponseEntity(
      creationAt: auth.creationAt,
      name: auth.name,
      email: auth.email,
      role: auth.role,
      updatedAt: auth.updatedAt,
      avatar: auth.avatar,
    );
  }

  static SignupModel toSignupModel(SignupEntity auth) {
    return SignupModel(email: auth.email, password: auth.password);
  }

  static SigninModel toSigninModel(SigninEntity auth) {
    return SigninModel(email: auth.email, password: auth.password);
  }

  static SigninResponseEntity toSigninEntity(SigninResponseModel auth) {
    return SigninResponseEntity(
      id: auth.id,
      email: auth.email,
      name: auth.name,
      role: auth.role,
      avatar: auth.avatar,
      creationAt: auth.creationAt,
      updatedAt: auth.updatedAt
    );
  }
}
