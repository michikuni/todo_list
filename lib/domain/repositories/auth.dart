import 'package:fpdart/fpdart.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/domain/entities/auth.dart';
import 'package:todo_list/domain/entities/auth_response.dart';

abstract class IAuthRepository{
  Future<Either<Failure, AuthResponseEntity>> signup(AuthEntity auth);
}