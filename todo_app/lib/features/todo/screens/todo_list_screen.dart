import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../todo_provider.dart';
import '../widgets/todo_item.dart';

class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<ToDoProvider>(context);
    var todos = todoProvider.todos;

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ToDo List'),
            bottom: const TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: 'To Do'),
                Tab(text: 'Completed'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ToDoTab(todos: todos.where((todo) => !todo.isCompleted).toList()),
              DoneTab(todos: todos.where((todo) => todo.isCompleted).toList()),
            ],
          ),
        ),
      ),
    );
  }
}

class ToDoTab extends StatelessWidget {
  final List<ToDo> todos;

  const ToDoTab({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ToDoItem(todo: todos[index]);
      },
    );
  }
}


class DoneTab extends StatelessWidget {
  final List<ToDo> todos;

  const DoneTab({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ToDoItem(todo: todos[index]);
      },
    );
  }
}
