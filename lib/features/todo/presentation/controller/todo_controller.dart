import 'package:flutter/material.dart';
import 'package:todo_p1/features/todo/domain/entity/todo_entity.dart';
import 'package:todo_p1/features/todo/domain/repository/todo_repositoty.dart';
import 'package:uuid/uuid.dart';

enum TodoState {
  initial,
  loading,
  success,
  error,
}

class TodoController with ChangeNotifier {
  final TodoRepository _repo;
  List<TodoEntity> _todoList = [];
  List<TodoEntity> get getTodoList => _todoList;

  int _countUnfinished = 0;
  int get getCountUnfinished => _countUnfinished;

  TodoState state = TodoState.initial;

  TodoController(this._repo);

  void init() async {
    state = TodoState.loading;

    final result = await _repo.writeTodo(false);

    result.fold(
      (l) => state = TodoState.error,
      (list) => _todoList = list,
    );

    _countUnfinished = _todoList.where((element) => !element.isCheck).length;
    state = TodoState.success;
    notifyListeners();
  }

  Future<void> onChangedIsCheck(bool isCheck, int index) async {
    final entity = _todoList[index];
    entity.isCheck = isCheck;
    final result = await _repo.udpateTodo(entity);
    result.fold((l) => entity.isCheck = !isCheck, (r) {
      _countUnfinished = _todoList.where((element) => !element.isCheck).length;
      _todoList.removeAt(index);
    });
    notifyListeners();
  }

  Future<void> addTodo(String title, String description) async {
    final entity = TodoEntity(
      id: const Uuid().v1(),
      title: title,
      description: description,
    );
    final result = await _repo.readTodo(entity);

    result.fold((l) => null, (r) {
      _todoList.add(entity);
      _countUnfinished = _todoList.where((element) => !element.isCheck).length;
    });
    notifyListeners();
  }
}
