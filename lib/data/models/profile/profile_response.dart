
import 'package:todo_list/domain/entities/profile/profile_response.dart';

class ProfileResponseModel extends ProfileResponseEntity {
  final String password;
  ProfileResponseModel({
    required super.id,
    required super.email,
    required this.password,
    required super.name,
    required super.role,
    required super.avatar,
    required super.creationAt,
    required super.updatedAt
  });
  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
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