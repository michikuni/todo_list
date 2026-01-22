import 'package:todo_list/domain/entities/auth_response.dart';

enum SignupStatus { initial, progress, success, failure }

class SignupState {
  final String username;
  final String password;
  final String confirmPassword;
  final AuthResponseEntity auth;
  final SignupStatus status;

  const SignupState({
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.status = SignupStatus.initial,
    this.auth = const AuthResponseEntity(email: '', name: '', role: '', avatar: '', creationAt: '', updatedAt: '')
  });

  SignupState copyWith({
    String? username,
    String? password,
    String? confirmPassword,
    SignupStatus? status,
    AuthResponseEntity? auth
  }){
    return SignupState(
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      auth: auth ?? this.auth
    );
  }
}
