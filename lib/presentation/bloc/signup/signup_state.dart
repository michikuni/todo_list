import 'package:formz/formz.dart';
import 'package:todo_list/domain/entities/auth/auth_response.dart';
import 'package:todo_list/presentation/bloc/signup/form/confirm_password_input.dart';
import 'package:todo_list/presentation/bloc/signup/form/email_input.dart';
import 'package:todo_list/presentation/bloc/signup/form/password_input.dart';


class SignupState {
  final EmailInput username;
  final PasswordInput password;
  final ConfirmPasswordInput confirmPassword;
  final SignupResponseEntity auth;
  final FormzSubmissionStatus status;
  final bool isValid;

  const SignupState({
    this.username = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmPasswordInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.auth = const SignupResponseEntity(email: '', name: '', role: '', avatar: '', creationAt: '', updatedAt: ''),
    this.isValid = false
  });

  SignupState copyWith({
    EmailInput? username,
    PasswordInput? password,
    ConfirmPasswordInput? confirmPassword,
    FormzSubmissionStatus? status,
    SignupResponseEntity? auth,
    bool? isValid
  }){
    return SignupState(
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      auth: auth ?? this.auth,
      isValid: isValid ?? this.isValid
    );
  }
}
