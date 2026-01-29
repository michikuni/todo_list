import 'package:formz/formz.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';

class TaskState {
  final String content;
  final String description;
  final DateTime date;
  final int minutes;
  final Category category;
  final int priority;
  final int userId;
  final String email;
  final String name;
  final String avatar;
  final bool isDone;
  final FormzSubmissionStatus status;
  const TaskState({
    this.userId = 1,
    this.name = '',
    this.email = '',
    this.avatar = '',
    required this.date,
    this.minutes = 500,
    this.category = const Category(
      name: 'Home',
      color: 0xFFFF8080,
      icon: 'assets/icons/home.svg',
    ),
    this.priority = 1,
    this.content = '',
    this.description = '',
    this.isDone = false,
    this.status = FormzSubmissionStatus.initial
  });
  factory TaskState.initial() {
    final now = DateTime.now();
    return TaskState(date: DateTime(now.year, now.month, now.day));
  }
  TaskState copyWith({
    int? userId,
    String? email,
    String? name,
    String? avatar,
    int? minutes,
    DateTime? date,
    Category? category,
    int? priority,
    String? content,
    String? description,
    bool? isDone,
    FormzSubmissionStatus? status
  }) {
    return TaskState(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      date: date ?? this.date,
      minutes: minutes ?? this.minutes,
      category: category ?? this.category,
      priority: priority ?? this.priority,
      content: content ?? this.content,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      status: status ?? this.status
    );
  }
}
