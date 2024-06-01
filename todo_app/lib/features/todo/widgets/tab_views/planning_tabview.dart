import 'package:flutter/material.dart';

import '../../todo_provider.dart';
import '../to_do_tab.dart';

class PlanningTabView extends StatelessWidget {
  const PlanningTabView({
    super.key,
    required this.todoProvider,
  });

  final ToDoProvider todoProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          collapsedBackgroundColor: Colors.grey.shade200,
          iconColor: Colors.black,
          title: const Text(
            'DueDate',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            const SizedBox(height: 4),
            ToDoTab(
              todos: todoProvider.todos.where((todo) => todo.isOverdue()).toList(),
            ),
          ],
        ),
        const SizedBox(height: 250), 
         ExpansionTile(
          collapsedBackgroundColor: Colors.grey.shade200,
          iconColor: Colors.black,
          title: const Text(
            'Planning',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            const SizedBox(height: 4),
            ToDoTab(
              todos: todoProvider.todos
                  .where((todo) => !todo.isCompleted)
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}