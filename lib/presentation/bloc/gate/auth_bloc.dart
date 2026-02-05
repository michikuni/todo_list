import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';
import 'package:todo_list/domain/usecases/profile/get_profile.dart';
import 'package:todo_list/presentation/bloc/gate/auth_event.dart';
import 'package:todo_list/presentation/bloc/gate/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokenStorage storage;
  final GetProfileUseCase getProfile;

  AuthBloc({required this.getProfile, required this.storage})
    : super(const AuthInitial()) {
    on<AuthCheckEvent>((event, emit) async {
      emit(AuthLoading(locale: state.locale));

      final token = await storage.getAccessToken();
      if (token != null) {
        final response = await getProfile();
        response.fold(
          (_) => emit(AuthUnauthenticated(locale: state.locale)),
          (_) => emit(AuthAuthenticated(locale: state.locale)),
        );
      } else {
        emit(AuthUnauthenticated(locale: state.locale));
      }
    });

    on<AuthLoggedOut>((event, emit) async {
      await storage.clear();
      emit(AuthUnauthenticated(locale: state.locale));
    });

    on<OnChangedLocale>((event, emit) {
      emit(LocaleChangedState(event.locale));
      add(AuthCheckEvent());
    });
  }
}
