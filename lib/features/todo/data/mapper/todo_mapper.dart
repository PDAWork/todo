import 'package:todo_p1/features/todo/data/model/todo_model.dart';
import 'package:todo_p1/features/todo/domain/entity/todo_entity.dart';

extension TodoMapperModel on TodoModel {
  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      title: name,
      description: description,
      isCheck: isCheck,
    );
  }
}

extension TodoMapperEntity on TodoEntity {
  TodoModel toModel() {
    return TodoModel(
      id: id,
      name: title,
      description: description,
      isCheck: isCheck,
    );
  }
}
