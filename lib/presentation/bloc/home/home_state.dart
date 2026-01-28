  import 'package:formz/formz.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';

  enum Category { grocery, work, sports, design, university, social, music, health, movie, home, create }
  class HomeState {
    final int id;
    final String email;
    final String name;
    final String avatar;
    final int minutes;
    final DateTime date;
    final FormzSubmissionStatus status;
    final Category category;
    final int priority;
    final String content;
    final String description;
    final List<TodoWithKeyEntity> listTodo;
    final int key;
    const HomeState({
      this.name = '',
      this.id = 1,
      this.email = '',
      this.avatar = '',
      this.status = FormzSubmissionStatus.initial,
      required this.date,
      this.minutes = 0,
      this.category = Category.home,
      this.priority = 1,
      this.content = '',
      this.description = '',
      this.listTodo = const [],
      this.key = 1
    });
    factory HomeState.initial() {
      final now = DateTime.now();
      return HomeState(
        date: DateTime(now.year, now.month, now.day),
      );
    }
    HomeState copyWith({
      int? id,
      String? email,
      String? name,
      String? avatar,
      FormzSubmissionStatus? status,
      int? minutes,
      DateTime? date,
      Category? category,
      int? priority,
      String? content,
      String? description,
      List<TodoWithKeyEntity>? listTodo,
      int? key
    }) {
      return HomeState(
        id: id ?? this.id,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        email: email ?? this.email,
        status: status ?? this.status,
        date: date ?? this.date,
        minutes: minutes ?? this.minutes,
        category: category ?? this.category,
        priority: priority ?? this.priority,
        content: content ?? this.content,
        description: description ?? this.description,
        listTodo: listTodo ?? this.listTodo,
        key: key ?? this.key
      );
    }
  }
