import 'package:todo_list/data/models/todo/todo_model.dart';
import 'package:todo_list/data/models/todo/todo_with_key.dart';

abstract class ITodoLocalDataSource{
  Future<void> addTodo(TodoModel todo);
  Future<List<TodoWithKeyModel>> getTodos();
  Future<void> updateTodo (TodoModel todo, int key);
  Future<void> deleteTodo (int key);
}