import 'package:injectable/injectable.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/domain/entities/auth/auth.dart';
import 'package:todo_list/domain/entities/auth/auth_response.dart';
import 'package:todo_list/domain/repositories/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthUseCase {}

@lazySingleton
class SignupUseCase extends AuthUseCase {
  final IAuthRepository _authRepository;
  SignupUseCase(this._authRepository);
  Future<Either<Failure, SignupResponseEntity>> call(SignupEntity auth) {
    return _authRepository.signup(auth);
  }
}

@lazySingleton
class SigninUseCase extends AuthUseCase {
  final IAuthRepository _authRepository;
  SigninUseCase(this._authRepository);
  Future<Either<Failure, SigninResponseEntity>> call(SigninEntity auth) {
    return _authRepository.signin(auth);
  }
}
