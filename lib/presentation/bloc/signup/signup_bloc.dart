import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/domain/usecases/auth.dart';
import 'package:todo_list/presentation/bloc/signup/signup_event.dart';
import 'package:todo_list/presentation/bloc/signup/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final CreateAuthUseCase createAuth;
  SignupBloc({required this.createAuth}) : super(SignupState()) {
    on<SignupSubmitEvent>((event, emit) async {
      emit(state.copyWith(status: SignupStatus.progress));
      final response = await createAuth(event.auth);
      response.fold(
        (onLeft) {
          emit(state.copyWith(status: SignupStatus.failure));
        },
        (onRight) {
          emit(state.copyWith(auth: onRight, status: SignupStatus.success));
        },
      );
    });
  }
}
