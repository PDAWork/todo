import 'package:dartz/dartz.dart';
import 'package:todo_p1/core/error/fauiler.dart';
import 'package:todo_p1/features/todo/domain/entity/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<Fauiler, List<TodoEntity>>> writeTodo([
    bool isFinished = false,
  ]);
  Future<Either<Fauiler, Unit>> readTodo(TodoEntity entity);
  Future<Either<Fauiler, Unit>> udpateTodo(TodoEntity entity);
}
