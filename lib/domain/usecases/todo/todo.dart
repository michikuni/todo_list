import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';
import 'package:todo_list/domain/repositories/todo/todo.dart';

@lazySingleton
class GetTodoUseCase{
  final ITodoRepository _repository;
  GetTodoUseCase(this._repository);
  Future<Option<List<TodoWithKeyEntity>>>call(){
    return _repository.getTodos();
  }
}

@lazySingleton
class AddTodoUseCase{
  final ITodoRepository _repository;
  AddTodoUseCase(this._repository);
  Future<void>call(TodoEntity todo){
    return _repository.addTodo(todo);
  }
}

@lazySingleton
class UpdateTodoUseCase{
  final ITodoRepository _repository;
  UpdateTodoUseCase(this._repository);
  Future<void>call(int key, TodoEntity todo){
    return _repository.updateTodo(key, todo);
  }
}

@lazySingleton
class DeleteTodoUseCase{
  final ITodoRepository _repository;
  DeleteTodoUseCase(this._repository);
  Future<void>call(int key){
    return _repository.deleteTodo(key);
  }
}