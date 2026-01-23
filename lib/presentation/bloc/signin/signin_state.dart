import 'package:formz/formz.dart';
import 'package:todo_list/domain/entities/auth/auth_response.dart';

class SigninState {
  final String username;
  final String password;
  final SigninResponseEntity userData;
  final FormzSubmissionStatus status;
  const SigninState({
    this.username = '',
    this.password = '',
    this.userData = const SigninResponseEntity(
      email: '',
      name: '',
      role: '',
      avatar: '',
      creationAt: '',
      updatedAt: '',
    ),
    this.status = FormzSubmissionStatus.initial,
  });

  SigninState copyWith({
    String? username,
    String? password,
    SigninResponseEntity? userData,
    FormzSubmissionStatus? status
  }){
    return SigninState(
      username: username ?? this.username,
      password: password ?? this.password,
      userData: userData ?? this.userData,
      status: status ?? this.status
    );
  }
}
