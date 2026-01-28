import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/data/datasources/local/hive/todo.dart';
import 'package:todo_list/data/mappers/todo/todo.dart';
import 'package:todo_list/data/models/todo/todo_model.dart';
import 'package:todo_list/data/models/todo/todo_with_key.dart';

@LazySingleton(as: ITodoLocalDataSource)
class TodoLocalDataSource implements ITodoLocalDataSource {
  @override
  Future<void> addTodo(TodoModel todo) async {
    try {
      final box = Hive.box<TodoModel>('todos');
      await box.add(todo);
    } on HiveError catch (e) {
      debugPrint("Hive error: ${e.message}");
      rethrow;
    } catch (e) {
      debugPrint("Unknown error: $e");
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(int key) async {
    try {
      final box = Hive.box<TodoModel>('todos');
      await box.delete(key);
    } catch (e) {
      debugPrint("Delete error: $e");
    }
  }

  @override
  Future<List<TodoWithKeyModel>> getTodos() async {
    final todoBox = await Hive.openBox<TodoModel>('todos');
    return todoBox.toMap().entries.map((e) {
      return TodoWithKeyModel(
        key: e.key as int,
        todo: TodoMapper.toEntity(e.value),
      );
    }).toList();
  }

  @override
  Future<void> updateTodo(TodoModel todo, int key) async {
    try {
    final box = Hive.box<TodoModel>('todos');
    await box.put(key, todo);
  } on HiveError catch (e) {
    debugPrint("Hive error: ${e.message}");
    rethrow;
  } catch (e) {
    debugPrint("Unknown error: $e");
    rethrow;
  }
  }
}
