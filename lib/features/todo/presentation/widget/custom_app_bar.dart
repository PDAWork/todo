import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_p1/features/todo/presentation/controller/todo_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
          'Не выполнено ${context.watch<TodoController>().getCountUnfinished}'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
