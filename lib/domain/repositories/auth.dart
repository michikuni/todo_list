import 'package:todo_list/domain/entities/auth.dart';

abstract class IAuthRepository{
  Future<AuthEntity> signup(String email, String password);
}