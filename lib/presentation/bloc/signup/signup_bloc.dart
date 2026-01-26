import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:todo_list/domain/entities/auth/auth.dart';
import 'package:todo_list/domain/usecases/auth/auth.dart';
import 'package:todo_list/presentation/bloc/signup/signup_event.dart';
import 'package:todo_list/presentation/bloc/signup/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUseCase signup;
  SignupBloc({required this.signup}) : super(SignupState()) {
    
    //Click register post data register
    on<SignupSubmitEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      print(state.username);
      final response = await signup(SignupEntity(email: state.username, password: state.password));
      response.fold(
        (onLeft) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        },
        (onRight) {
          emit(state.copyWith(auth: onRight, status: FormzSubmissionStatus.success));
        },
      );
    });

    //emit username
    on<OnUsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.userName));
    },);

    //emit password
    on<OnPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    },);

    //emit confirm password
    on<OnConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    },);
  }
}
