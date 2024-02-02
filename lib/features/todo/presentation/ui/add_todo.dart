import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_p1/features/todo/presentation/controller/todo_controller.dart';

class AddTodo extends StatelessWidget {
  AddTodo({super.key});

  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавление задачи"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(!_keyForm.currentState!.validate()) return;
          context
              .read<TodoController>()
              .addTodo(_title.text, _description.text);
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Поле пустое';
                  }
                  return null;
                },
                controller: _title,
                decoration: const InputDecoration(
                  label: Text('Название'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Поле пустое';
                  }
                  return null;
                },
                controller: _description,
                minLines: 3,
                maxLines: 3,
                decoration: const InputDecoration(
                  label: Text('Описание'),
                  border: OutlineInputBorder(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
