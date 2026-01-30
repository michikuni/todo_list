import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';
import 'package:todo_list/domain/usecases/todo/todo.dart';
import 'package:todo_list/presentation/bloc/task/task_event.dart';
import 'package:todo_list/presentation/bloc/task/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final UpdateTodoUseCase update;
  final DeleteTodoUseCase delete;
  TaskBloc({required this.update, required this.delete})
    : super(TaskState(date: DateTime.now())) {
    on<LoadData>((event, emit) {
      emit(
        state.copyWith(
          avatar: event.avatar,
          email: event.email,
          name: event.name,
          userId: event.userId,
        ),
      );
    });
    on<OnDone>((event, emit) {
      emit(state.copyWith(isDone: event.isDone));
    },);
    on<OnCategoryChanged>((event, emit) {
      emit(state.copyWith(category: event.category));
    });
    on<OnContentChanged>((event, emit) {
      emit(state.copyWith(content: event.content));
    });
    on<OnDateChanged>((event, emit) {
      emit(state.copyWith(date: event.date));
    });
    on<OnDesciptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });
    on<OnPriorityChanged>((event, emit) {
      emit(state.copyWith(priority: event.priority));
    });
    on<OnTimeChanged>((event, emit) {
      emit(state.copyWith(minutes: event.time));
    });
    on<OnSubmit>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final data = TodoEntity(
        content: state.content,
        description: state.description,
        category: state.category,
        priority: state.priority,
        date: state.date,
        minutes: state.minutes,
        userId: state.userId,
        email: state.email,
        name: state.name,
        avatar: state.avatar,
        isDone: state.isDone,
      );
      await update(event.id, data);
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    });
    on<DeleteTask>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await delete(event.id);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    });
  }
}
