import 'package:todo_list/domain/entities/auth_response.dart';

class AuthResponseModel extends AuthResponseEntity {
  final String? id;
  final String password;
  AuthResponseModel({
    this.id,
    required super.email,
    required this.password,
    required super.name,
    required super.role,
    required super.avatar,
    required super.creationAt,
    required super.updatedAt
  });
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
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