import 'package:fpdart/fpdart.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/domain/entities/auth/auth.dart';
import 'package:todo_list/domain/entities/auth/auth_response.dart';

abstract class IAuthRepository{
  Future<Either<Failure, SignupResponseEntity>> signup(SignupEntity auth);
  Future<Either<Failure, SigninResponseEntity>> signin(SigninEntity auth);
}