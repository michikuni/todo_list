import 'package:injectable/injectable.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/domain/entities/auth.dart';
import 'package:todo_list/domain/entities/auth_response.dart';
import 'package:todo_list/domain/repositories/auth.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthUseCase {}

@lazySingleton
class CreateAuthUseCase extends AuthUseCase {
  final IAuthRepository _authRepository;
  CreateAuthUseCase(this._authRepository);

  Future<Either<Failure, AuthResponseEntity> >call(AuthEntity auth) {
    return _authRepository.signup(auth);
  }
}
