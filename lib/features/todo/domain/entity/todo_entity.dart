class TodoEntity {
  final String id;
  final String title;
  final String description;
  bool isCheck;

  TodoEntity({
    required this.id,
    required this.title,
    required this.description,
    this.isCheck = false,
  });
}
