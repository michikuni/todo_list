import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/constants/hive.dart';
import 'package:todo_list/data/datasources/local/hive/todo.dart';
import 'package:todo_list/data/datasources/local/token/token_stograge.dart';
import 'package:todo_list/data/mappers/todo/todo.dart';
import 'package:todo_list/data/models/todo/todo_model.dart';
import 'package:todo_list/data/models/todo/todo_with_key.dart';

@LazySingleton(as: ITodoLocalDataSource)
class TodoLocalDataSource implements ITodoLocalDataSource {
  final TokenStorage storage;
  TodoLocalDataSource(this.storage);
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
    final userId = await storage.getUserId();
    final box = Hive.box<TodoModel>(HiveText.boxName);
    final data = box
        .toMap()
        .entries
        .where((todo) => todo.value.userId == userId)
        .map(
          (e) =>
              TodoWithKeyModel(key: e.key, todo: TodoMapper.toEntity(e.value)),
        )
        .toList();
    return data;
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
