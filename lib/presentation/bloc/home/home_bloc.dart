import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';
import 'package:todo_list/domain/usecases/profile/profile.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProfileUseCase getProfile;
  final TokenStorage tokenStorage;
  HomeBloc({
    required this.getProfile,
    required this.tokenStorage,
  }) : super(HomeState()) {
    on<GetProfileEvent>((event, emit) async {
      final token = await tokenStorage.getAccessToken();
      if (token != null) {
        final response = await getProfile();
        response.fold(
          (onLeft) {
            emit(state.copyWith(status: FormzSubmissionStatus.failure));
          },
          (onRight) {
            emit(
              state.copyWith(
                id: onRight.id,
                avatar: onRight.avatar,
                email: onRight.email,
                name: onRight.name,
                status: FormzSubmissionStatus.success,
              ),
            );
          },
        );
      }
    });
  }
}
