import 'package:injectable/injectable.dart';
import 'package:todo_list/domain/entities/auth.dart';
import 'package:todo_list/domain/repositories/auth.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthUseCase {}

@lazySingleton
class CreateAuthUseCase extends AuthUseCase {
  final IAuthRepository _authRepository;
  CreateAuthUseCase(this._authRepository);

  TaskEither<String, AuthEntity> call(String email, String password) {
    return TaskEither.tryCatch(() async {
      return await _authRepository.signup(email, password);
    }, (onError, stackTrace) => 'Lỗi CreateAuthUseCase $onError');
  }
}
