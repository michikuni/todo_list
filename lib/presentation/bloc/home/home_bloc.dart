import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';
import 'package:todo_list/domain/usecases/profile/get_profile.dart';
import 'package:todo_list/domain/usecases/profile/update_name_profile.dart';
import 'package:todo_list/domain/usecases/todo/todo.dart';
import 'package:todo_list/presentation/bloc/home/home_event.dart';
import 'package:todo_list/presentation/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProfileUseCase getProfile;
  final UpdateNameProfileUseCase updateNameProfile;
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
    required this.updateNameProfile
  }) : super(HomeState.initial()) {
    //reset status if out add todo dialog to reset state
    on<ResetAddTodoEvent>((event, emit) {
      final initial = HomeState.initial();
      emit(initial.copyWith(listTodo: state.listTodo));
    });


    //make todo completed or opposite
    on<OnChangedCompletedStatus>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      // print(state.status);
      final data = TodoEntity(
        content: event.todo.todo.content,
        description: event.todo.todo.description,
        category: event.todo.todo.category,
        priority: event.todo.todo.priority,
        date: event.todo.todo.date,
        minutes: event.todo.todo.minutes,
        userId: event.todo.todo.userId,
        email: event.todo.todo.email,
        name: event.todo.todo.name,
        avatar: event.todo.todo.avatar,
        isDone: !event.todo.todo.isDone,
      );
      await updateTodo(event.todo.key, data);
      add(GetTodoEvent());
      emit(state.copyWith(status: FormzSubmissionStatus.success));
      // print(state.status);
    });

    //get all todo
    on<GetTodoEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await getTodo();
      response.fold(
        () {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        },
        (onSome) {
          final data = onSome.map((e) {
            return TodoWithKeyEntity(
              key: e.key,
              todo: e.todo
            );
          }).toList();
          emit(
            state.copyWith(
              listTodo: data,
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
        category: state.category,
        priority: state.priority,
        date: state.date,
        minutes: state.minutes,
        userId: userId ?? state.id,
        email: state.email,
        name: state.name,
        avatar: state.avatar,
        isDone: false,
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

    // get user profile
    on<GetProfileEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      
      final token = await tokenStorage.getAccessToken();
      log('Token: ${token}');
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
        // log('Bloc id: ${state.id}');
        // log('Bloc name: ${state.name}');
        // log('Bloc email: ${state.email}');
        // log('Bloc avatar: ${state.avatar}');
        add(GetTodoEvent());
      }
      // print(state.status);
    });

    on<UpdateNameProfileEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await updateNameProfile(event.name);
      response.fold((onLeft){
        log(onLeft.message);
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }, (onRight){
        emit(state.copyWith(name: onRight.name, status: FormzSubmissionStatus.success));
      });
      add(GetProfileEvent());
    },);
  }
}
