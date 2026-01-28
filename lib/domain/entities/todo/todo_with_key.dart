import 'package:todo_list/domain/entities/todo/todo.dart';

class TodoWithKeyEntity{
  final int key;
  final TodoEntity todo;

  TodoWithKeyEntity({required this.key, required this.todo});
}