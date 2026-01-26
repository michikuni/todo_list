import 'package:todo_list/domain/entities/auth/auth.dart';

class SignupModel extends SignupEntity{
  SignupModel({
    required super.email,
    required super.password
  });
  Map<String, dynamic> toJson(SignupModel auth) {
    return {
      "name": auth.name,
      "email": auth.email,
      "password": auth.password,
      "avatar": auth.avatar,
    };
  }
}

class SigninModel extends SigninEntity{
  SigninModel({
    required super.email,
    required super.password
  });
  Map<String, dynamic> toJson(SigninModel auth) {
    return {
      "email": auth.email,
      "password": auth.password,
    };
  }
}
