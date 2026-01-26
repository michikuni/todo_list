import 'package:todo_list/domain/entities/auth/auth_response.dart';

class SignupResponseModel extends SignupResponseEntity {
  final int? id;
  final String password;
  SignupResponseModel({
    this.id,
    required super.email,
    required this.password,
    required super.name,
    required super.role,
    required super.avatar,
    required super.creationAt,
    required super.updatedAt
  });
  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      role: json['role'],
      avatar: json['avatar'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class SigninResponseModel extends SigninResponseEntity {
  final String password;
  SigninResponseModel({
    required super.id,
    required super.email,
    required this.password,
    required super.name,
    required super.role,
    required super.avatar,
    required super.creationAt,
    required super.updatedAt
  });
  factory SigninResponseModel.fromJson(Map<String, dynamic> json) {
    return SigninResponseModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      role: json['role'],
      avatar: json['avatar'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }
}