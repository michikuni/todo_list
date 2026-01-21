import 'package:todo_list/domain/entities/auth.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.uid,
    required super.email,
    required super.createdTime,
  });
}
