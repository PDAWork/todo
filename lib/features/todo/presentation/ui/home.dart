import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_p1/features/todo/presentation/controller/todo_controller.dart';
import 'package:todo_p1/features/todo/presentation/widget/todo_card.dart';
import 'package:todo_p1/routes/app_router.dart';
import 'package:todo_p1/routes/router_utils.dart';

import '../widget/custom_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter.router.goNamed(Pages.addTodo.screenName);
        },
        child: const Icon(Icons.add),
      ),
      body: switch (
          context.select<TodoController, TodoState>((value) => value.state)) {
        TodoState.initial || TodoState.loading => const Center(
            child: CircularProgressIndicator(),
          ),
        TodoState.success => ListView.builder(
            itemCount: context.select<TodoController, int>(
              (value) => value.getTodoList.length,
            ),
            itemBuilder: (context, index) {
              return TodoCard(
                index: index,
              );
            }),
        TodoState.error => const Center(
            child: Text('Ошибка'),
          ),
      },
    );
  }
}
