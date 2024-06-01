import 'package:flutter/material.dart';

import '../../todo_provider.dart';
import '../done_tab.dart';

class DoneTabView extends StatelessWidget {
  const DoneTabView({
    super.key,
    required this.todoProvider,
  });

  final ToDoProvider todoProvider;

  @override
  Widget build(BuildContext context) {
    return DoneTab(
      todos: todoProvider.todos
          .where((todo) => todo.isCompleted)
          .toList(),
    );
  }
}