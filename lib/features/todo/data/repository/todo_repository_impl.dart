import 'package:dartz/dartz.dart';
import 'package:todo_p1/core/error/exception.dart';
import 'package:todo_p1/core/error/fauiler.dart';
import 'package:todo_p1/features/todo/data/data_source.dart/todo_local_hive.dart';
import 'package:todo_p1/features/todo/data/mapper/todo_mapper.dart';
import 'package:todo_p1/features/todo/domain/entity/todo_entity.dart';
import 'package:todo_p1/features/todo/domain/repository/todo_repositoty.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalHive local;

  TodoRepositoryImpl({required this.local});

  @override
  Future<Either<Fauiler, Unit>> readTodo(TodoEntity entity) async {
    try {
      await local.readTodo(entity.toModel());
      return right(unit);
    } on CacheException catch (_) {
      return left(CacheFauiler());
    }
  }

  @override
  Future<Either<Fauiler, List<TodoEntity>>> writeTodo([
    bool isFinished = false,
  ]) async {
    try {
      final data = await local.writeTodo();
      final result = data
          .where(
            (element) => element.isCheck == isFinished,
          )
          .map(
            (e) => e.toEntity(),
          )
          .toList();

      return right(result);
    } on CacheException catch (_) {
      return left(CacheFauiler());
    }
  }

  @override
  Future<Either<Fauiler, Unit>> udpateTodo(TodoEntity entity) async {
    try {
      await local.updateTodo(entity.toModel());
      return right(unit);
    } on CacheException catch (_) {
      return left(CacheFauiler());
    }
  }
}
