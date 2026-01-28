import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';

abstract class ITodoRepository{
  Future<Option<List<TodoWithKeyEntity>>> getTodos();
  Future<void> addTodo(TodoEntity todo);
  Future<void> deleteTodo(int key);
  Future<void> updateTodo(int key, TodoEntity todo);
}