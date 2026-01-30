import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:todo_list/domain/entities/auth/auth.dart';
import 'package:todo_list/domain/usecases/auth/auth.dart';
import 'package:todo_list/presentation/bloc/signin/form/email_input.dart';
import 'package:todo_list/presentation/bloc/signin/form/password_input.dart';
import 'package:todo_list/presentation/bloc/signin/signin_event.dart';
import 'package:todo_list/presentation/bloc/signin/signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final SigninUseCase signin;
  SigninBloc({required this.signin}) : super(SigninState()) {
    on<OnUsernameChanged>((event, emit) {
      final email = EmailInput.dirty(event.username);
      emit(state.copyWith(username: email, isValid: Formz.validate([email])));
    });

    on<OnPasswordChanged>((event, emit) {
      final password = PasswordInput.dirty(event.password);
      emit(state.copyWith(password: password, isValid: Formz.validate([password])));
    });

    on<SigninSubmitEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await signin(
        SigninEntity(email: state.username.value, password: state.password.value),
      );
      response.fold(
        (onLeft) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        },
        (onRight) {
          emit(
            state.copyWith(
              userData: onRight,
              status: FormzSubmissionStatus.success,
            ),
          );
        },
      );
    });
  }
}
