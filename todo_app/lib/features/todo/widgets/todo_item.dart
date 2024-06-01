import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../todo_provider.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final bool? isOverdue;

  const ToDoItem({super.key, required this.todo, this.isOverdue,});

  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<ToDoProvider>(context);

    return ListTile(
      title: Text(
        todo.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: isOverdue ?? false ? Colors.red : null,
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle:isOverdue != null
          ? Text(isOverdue.toString())
          : null,
      leading: Checkbox(
        activeColor: Colors.blue,
        value: todo.isCompleted,
        onChanged: (value) {
          todoProvider.toggleComplete(todo.id);
        },
      ),
      trailing:Wrap(
        spacing: 12,
        children: [
          IconButton(
            icon: Icon(
              todo.isStarred ? Icons.star : Icons.star_border,
              color: todo.isStarred ? Colors.amber : null,
            ),
            onPressed: () {
              todoProvider.toggleStar(todo.id);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Color.fromARGB(233, 243, 79, 67),
            ),
            onPressed: () {
              todoProvider.deleteToDo(todo.id);
            },
          ),
        ],
      ),
    );
  }
}