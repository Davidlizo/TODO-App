import 'package:flutter/material.dart';

import '../../todo_provider.dart';
import '../proggress_card.dart';
import '../to_do_tab.dart';

class ToDoTabView extends StatelessWidget {
  const ToDoTabView({
    super.key,
    required this.todoProvider,
  });

  final ToDoProvider todoProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: SizedBox(
            height: 220,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProgressCard(
                    title: 'Healthy',
                    completed: 5,
                    total: 8,
                    color: Colors.orange.shade200,
                    progressColor: Colors.orange,
                  ),
                  const SizedBox(width: 16),
                  ProgressCard(
                    title: 'Work',
                    completed: 7,
                    total: 12,
                    color: Colors.blue.shade200,
                    progressColor: Colors.blue,
                  ),
                  const SizedBox(width: 16),
                  ProgressCard(
                    title: 'Personal',
                    completed: 3,
                    total: 10,
                    color: Colors.purple.shade200,
                    progressColor: Colors.purple,
                  ),
                  const SizedBox(width: 16),
                  const ProgressCard(
    
                    title: 'Leisure',
                    completed: 8,
                    total: 15,
                    color: Color(0xff7DD957),
                    progressColor: Color(0xff0B2230),
                  ),
                ],
              ),
            ),
          ),
        ),
        ExpansionTile(
          collapsedBackgroundColor: Colors.grey.shade200,
          iconColor: Colors.black,
          title: const Text(
            'All To Do',
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
        )
      ],
    );
  }
}