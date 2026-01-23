import 'package:formz/formz.dart';
import 'package:todo_list/domain/entities/auth/auth_response.dart';


class SignupState {
  final String username;
  final String password;
  final String confirmPassword;
  final SignupResponseEntity auth;
  final FormzSubmissionStatus status;

  const SignupState({
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.status = FormzSubmissionStatus.initial,
    this.auth = const SignupResponseEntity(email: '', name: '', role: '', avatar: '', creationAt: '', updatedAt: '')
  });

  SignupState copyWith({
    String? username,
    String? password,
    String? confirmPassword,
    FormzSubmissionStatus? status,
    SignupResponseEntity? auth
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
