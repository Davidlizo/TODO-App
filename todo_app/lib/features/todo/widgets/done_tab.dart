import 'package:flutter/material.dart';

import '../models/todo.dart';
import 'todo_item.dart';

class DoneTab extends StatelessWidget {
  final List<ToDo> todos;

  const DoneTab({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
                height: 70,
                decoration:  const BoxDecoration(color: Color.fromARGB(33, 135, 132, 132)),
                child: ToDoItem(todo: todos[index])
          ),
        );
      },
    );
  }
}