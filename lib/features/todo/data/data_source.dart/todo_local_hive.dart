import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_p1/core/error/exception.dart';
import 'package:todo_p1/features/todo/data/model/todo_model.dart';

abstract interface class TodoLocalHive {
  Future<bool> initDb();

  Future<Unit> readTodo(TodoModel model);
  Future<List<TodoModel>> writeTodo();

  Future<Unit> updateTodo(TodoModel model);
}

class TodoLocalHiveimpl implements TodoLocalHive {
  final _kObjectBox = 'object_box';

  @override
  Future<bool> initDb() async {
    try {
      if (!kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      }
      Hive.registerAdapter(TodoModelAdapter());
      await Hive.openBox<TodoModel>(_kObjectBox);
      return true;
    } catch (_) {
      throw InitDBException();
    }
  }

  @override
  Future<Unit> readTodo(TodoModel model) async {
    final obejctBox = Hive.box<TodoModel>(_kObjectBox);
    await obejctBox.put(model.id, model);
    return Future.value(unit);
  }

  @override
  Future<List<TodoModel>> writeTodo() async {
    try {
      final objectBox = Hive.box<TodoModel>(_kObjectBox);
      return objectBox.values.toList();
    } catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<Unit> updateTodo(TodoModel model) {
    try {
      final objectBox = Hive.box<TodoModel>(_kObjectBox);
      objectBox.put(model.id, model);
      return Future.value(unit);
    } catch (_) {
      throw CacheException();
    }
  }
}
