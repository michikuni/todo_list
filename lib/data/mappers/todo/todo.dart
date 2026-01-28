import 'package:todo_list/data/models/todo/todo_model.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';

class TodoMapper {
  static TodoWithKeyEntity toKeyEntity(TodoModel todo, int key) {
    return TodoWithKeyEntity(key: key, todo: toEntity(todo));
  }

  static TodoEntity toEntity(TodoModel todo) {
    return TodoEntity(
      content: todo.content,
      description: todo.description,
      category: todo.category,
      priority: todo.priority,
      date: todo.date,
      minutes: todo.minutes,
      userId: todo.userId,
      email: todo.email,
      name: todo.name,
      avatar: todo.avatar,
    );
  }

  static TodoModel toModel(TodoEntity todo) {
    return TodoModel(
      content: todo.content,
      description: todo.description,
      category: todo.category,
      priority: todo.priority,
      date: todo.date,
      minutes: todo.minutes,
      userId: todo.userId,
      email: todo.email,
      name: todo.name,
      avatar: todo.avatar,
    );
  }
}
