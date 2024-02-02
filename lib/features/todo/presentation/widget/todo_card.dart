import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_p1/features/todo/presentation/controller/todo_controller.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(context.read<TodoController>().getTodoList[index].title),
        leading: Checkbox(
          value: context.watch<TodoController>().getTodoList[index].isCheck,
          onChanged: (value) => context.read<TodoController>().onChangedIsCheck(
                value!,
                index,
              ),
        ),
        children: [
          const Text("Описание"),
          Text(context.read<TodoController>().getTodoList[index].description),
        ],
      ),
    );
  }
}
