import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/constants/hive.dart';
import 'package:todo_list/data/datasources/local/hive/todo.dart';
import 'package:todo_list/data/mappers/todo/todo.dart';
import 'package:todo_list/data/models/todo/todo_model.dart';
import 'package:todo_list/data/models/todo/todo_with_key.dart';

@LazySingleton(as: ITodoLocalDataSource)
class TodoLocalDataSource implements ITodoLocalDataSource {
  @override
  Future<void> addTodo(TodoModel todo) async {
    try {
      final box = Hive.box<TodoModel>(HiveText.boxName);
      await box.add(todo);
    } on HiveError catch (e) {
      log("Hive error: ${e.message}");
      rethrow;
    } catch (e) {
      log("Unknown error: $e");
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(int key) async {
    try {
      final box = Hive.box<TodoModel>(HiveText.boxName);
      await box.delete(key);
    } catch (e) {
      log("Delete error: $e");
    }
  }

  @override
  Future<List<TodoWithKeyModel>> getTodos() async {
    final box = Hive.box<TodoModel>(HiveText.boxName);
    return box.toMap().entries.map((e) {
      return TodoWithKeyModel(
        key: e.key as int,
        todo: TodoMapper.toEntity(e.value),
      );
    }).toList();
  }

  @override
  Future<void> updateTodo(TodoModel todo, int key) async {
    try {
    final box = Hive.box<TodoModel>(HiveText.boxName);
    await box.put(key, todo);
  } on HiveError catch (e) {
    log("Hive error: ${e.message}");
    rethrow;
  } catch (e) {
    log("Unknown error: $e");
    rethrow;
  }
  }
}
