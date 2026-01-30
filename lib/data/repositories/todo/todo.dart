import 'dart:developer';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/data/datasources/local/hive/todo.dart';
import 'package:todo_list/data/mappers/todo/todo.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';
import 'package:todo_list/domain/entities/todo/todo_with_key.dart';
import 'package:todo_list/domain/repositories/todo/todo.dart';

@LazySingleton(as: ITodoRepository)
class TodoRepositoryImpl implements ITodoRepository {
  final ITodoLocalDataSource localData;
  TodoRepositoryImpl(this.localData);
  @override
  Future<void> addTodo(TodoEntity todo) async {
    if (todo.content.isEmpty || todo.description.isEmpty) {
      return;
    }
    try {
      await localData.addTodo(TodoMapper.toModel(todo));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(int key) async {
    try {
      await localData.deleteTodo(key);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Option<List<TodoWithKeyEntity>>> getTodos() async {
    try {
      final response = await localData.getTodos();
      final result = response.map((e) {
        return TodoWithKeyEntity(key: e.key, todo: e.todo);
      }).toList();
      return Option.fromNullable(result);
    } catch (e) {
      log(e.toString());
      return None();
    }
  }

  @override
  Future<void> updateTodo(int key, TodoEntity todo) async {
    try {
      await localData.updateTodo(TodoMapper.toModel(todo), key);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
