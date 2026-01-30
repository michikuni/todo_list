import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:todo_list/domain/entities/auth/auth.dart';
import 'package:todo_list/domain/usecases/auth/auth.dart';
import 'package:todo_list/presentation/bloc/signup/form/confirm_password_input.dart';
import 'package:todo_list/presentation/bloc/signup/form/email_input.dart';
import 'package:todo_list/presentation/bloc/signup/form/password_input.dart';
import 'package:todo_list/presentation/bloc/signup/signup_event.dart';
import 'package:todo_list/presentation/bloc/signup/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUseCase signup;
  SignupBloc({required this.signup}) : super(SignupState()) {
    //Click register post data register
    on<SignupSubmitEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      print(state.username);
      final response = await signup(
        SignupEntity(
          email: state.username.value,
          password: state.password.value,
        ),
      );
      response.fold(
        (onLeft) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        },
        (onRight) {
          emit(
            state.copyWith(
              auth: onRight,
              status: FormzSubmissionStatus.success,
            ),
          );
        },
      );
    });

    //emit username
    on<OnUsernameChanged>((event, emit) {
      final email = EmailInput.dirty(event.userName);
      emit(state.copyWith(username: email, isValid: Formz.validate([email])));
    });

    //emit password
    on<OnPasswordChanged>((event, emit) {
      final password = PasswordInput.dirty(event.password);
      emit(
        state.copyWith(password: password, isValid: Formz.validate([password])),
      );
    });

    //emit confirm password
    on<OnConfirmPasswordChanged>((event, emit) {
      final confirmPassword = ConfirmPasswordInput.dirty(
        password: state.password.value,
        value: event.confirmPassword,
      );
      emit(
        state.copyWith(
          confirmPassword: confirmPassword,
          isValid: Formz.validate([confirmPassword]),
        ),
      );
    });
  }
}
