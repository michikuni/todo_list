import 'package:formz/formz.dart';
import 'package:todo_list/domain/entities/auth/auth_response.dart';
import 'package:todo_list/presentation/bloc/signin/form/email_input.dart';
import 'package:todo_list/presentation/bloc/signin/form/password_input.dart';

class SigninState {
  final EmailInput username;
  final PasswordInput password;
  final SigninResponseEntity userData;
  final FormzSubmissionStatus status;
  final bool isValid;
  const SigninState({
    this.username = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.userData = const SigninResponseEntity(
      id: 1,
      email: '',
      name: '',
      role: '',
      avatar: '',
      creationAt: '',
      updatedAt: '',
    ),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });

  SigninState copyWith({
    EmailInput? username,
    PasswordInput? password,
    SigninResponseEntity? userData,
    FormzSubmissionStatus? status,
    bool? isValid
  }){
    return SigninState(
      username: username ?? this.username,
      password: password ?? this.password,
      userData: userData ?? this.userData,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid
    );
  }
}
