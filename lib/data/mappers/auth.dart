import 'package:todo_list/data/models/auth.dart';
import 'package:todo_list/data/models/auth_response.dart';
import 'package:todo_list/domain/entities/auth.dart';
import 'package:todo_list/domain/entities/auth_response.dart';

class AuthMapper {
  static AuthResponseEntity toEntity(AuthResponseModel auth) {
    return AuthResponseEntity(
      creationAt: auth.creationAt,
      name: auth.name,
      email: auth.email,
      role: auth.role,
      updatedAt: auth.updatedAt,
      avatar: auth.avatar,
    );
  }

  static AuthModel toModel(AuthEntity auth) {
    return AuthModel(
      email: auth.email,
      password: auth.password,
    );
  }
}
