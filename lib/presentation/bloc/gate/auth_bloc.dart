import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';
import 'package:todo_list/domain/usecases/profile/profile.dart';
import 'package:todo_list/presentation/bloc/gate/auth_event.dart';
import 'package:todo_list/presentation/bloc/gate/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokenStorage storage;
  final GetProfileUseCase getProfile;

  AuthBloc({required this.getProfile, required this.storage})
    : super(AuthInitial()) {
    on<AuthCheckEvent>((event, emit) async {
      emit(AuthLoading());
      final token = await storage.getAccessToken();
      // print(token);
      if (token != null) {
        final response = await getProfile();
        response.fold(
          (onLeft) {
            emit(AuthUnauthenticated());
          },
          (onRight) {
            emit(AuthAuthenticated());
          },
        );
      } else {
        emit(AuthUnauthenticated());
      }
    });
    on<AuthLoggedOut>((event, emit) async {
      await storage.clear();
      emit(AuthUnauthenticated());
    });
  }
}
