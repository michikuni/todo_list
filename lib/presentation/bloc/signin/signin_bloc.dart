import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:todo_list/domain/entities/auth/auth.dart';
import 'package:todo_list/domain/usecases/auth/auth.dart';
import 'package:todo_list/presentation/bloc/signin/signin_event.dart';
import 'package:todo_list/presentation/bloc/signin/signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final SigninUseCase signin;
  SigninBloc({required this.signin}) : super(SigninState()) {
    on<OnUsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<OnPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<SigninSubmitEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await signin(
        SigninEntity(email: state.username, password: state.password),
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
