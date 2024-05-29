import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../todo_provider.dart';
import '../widgets/todo_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<ToDoProvider>(context);
    var favoriteTodos = todoProvider.todos.where((todo) => todo.isStarred).toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: favoriteTodos.isEmpty
            ? const Center(child: Text('No favorites yet!'))
            : ListView.builder(
                itemCount: favoriteTodos.length,
                itemBuilder: (context, index) {
                  return ToDoItem(todo: favoriteTodos[index]);
                },
              ),
      ),
    );
  }
}
