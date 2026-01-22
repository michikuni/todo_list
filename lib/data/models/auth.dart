import 'package:todo_list/domain/entities/auth.dart';

class AuthModel extends AuthEntity{
  AuthModel({
    required super.email,
    required super.password
  });
  Map<String, dynamic> toJson(AuthModel auth) {
    return {
      "name": auth.name,
      "email": auth.email,
      "password": auth.password,
      "avatar": auth.avatar,
    };
  }
}
