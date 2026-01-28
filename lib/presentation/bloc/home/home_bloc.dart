import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';
import 'package:todo_list/domain/usecases/profile/profile.dart';
import 'package:todo_list/domain/usecases/todo/todo.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProfileUseCase getProfile;
  final TokenStorage tokenStorage;
  final GetTodoUseCase getTodo;
  final AddTodoUseCase addTodo;
  final UpdateTodoUseCase updateTodo;
  final DeleteTodoUseCase deleteTodo;

  HomeBloc({
    required this.getProfile,
    required this.tokenStorage,
    required this.getTodo,
    required this.addTodo,
    required this.deleteTodo,
    required this.updateTodo,
  }) : super(HomeState.initial()) {
    //reset status
    on<ResetAddTodoEvent>((event, emit) {
      final initial = HomeState.initial();
      emit(
        initial.copyWith(
          listTodo: state.listTodo, // 👈 giữ list
        ),
      );
    });

    //get todo
    on<GetTodoEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await getTodo();
      response.fold(
        () {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        },
        (onSome) {
          emit(
            state.copyWith(
              listTodo: onSome,
              status: FormzSubmissionStatus.success,
            ),
          );
        },
      );
    });

    // add todo
    on<OnSubmited>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final userId = await tokenStorage.getUserId();
      final data = TodoEntity(
        content: state.content,
        description: state.description,
        category: state.category.name,
        priority: state.priority,
        date: state.date,
        minutes: state.minutes,
        userId: userId ?? state.id,
        email: state.email,
        name: state.name,
        avatar: state.avatar,
      );
      await addTodo(data);
      final latestTodo = await getTodo();
      latestTodo.fold(
        () {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        },
        (t) {
          emit(
            state.copyWith(status: FormzSubmissionStatus.success, listTodo: t),
          );
        },
      );
    });

    // emit date
    on<OnDateChanged>((event, emit) {
      emit(state.copyWith(date: event.date));
    });

    // emit event
    on<OnContentChanged>((event, emit) {
      emit(state.copyWith(content: event.content));
    });

    // emit time
    on<OnTimeChanged>((event, emit) {
      final minutes = event.time.hour * 60 + event.time.minute;
      emit(state.copyWith(minutes: minutes));
    });

    // emit description
    on<OnDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    // emit priority
    on<OnPriorityChanged>((event, emit) {
      emit(state.copyWith(priority: event.priority));
    });

    // emit category
    on<OnCategoryChanged>((event, emit) {
      emit(state.copyWith(category: event.catergory));
    });

    // get profile user
    on<GetProfileEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final token = await tokenStorage.getAccessToken();
      print(token);
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
