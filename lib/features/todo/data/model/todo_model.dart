import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3, defaultValue: false)
  bool isCheck;

  TodoModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isCheck,
  });
}
