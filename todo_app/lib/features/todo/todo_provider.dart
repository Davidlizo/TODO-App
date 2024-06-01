import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/todo.dart';

class ToDoProvider with ChangeNotifier {
  List<ToDo> _todos = [];

  List<ToDo> get todos => _todos;

  ToDoProvider() {
    loadToDos();
  }

  Future<void> addToDo(String title) async {
    final newToDo = ToDo(
      id: DateTime.now().toString(),
      title: title,
      isCompleted: false,
      isStarred: false,
      dueDate: DateTime.now().add(const Duration(days: 7)),
    );
    _todos.add(newToDo);
    await saveToDos();
    notifyListeners();
  }

  void toggleComplete(String id) async {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].isCompleted = !_todos[index].isCompleted;
      await saveToDos();
      notifyListeners();
    }
  }

  void toggleStar(String id) async {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].isStarred = !_todos[index].isStarred;
      await saveToDos();
      notifyListeners();
    }
  }


  void deleteToDo(String id) async {
    _todos.removeWhere((todo) => todo.id == id);
    await saveToDos();
    notifyListeners();
  }

  Future<void> saveToDos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = _todos.map((todo) => todo.toJson()).toList();
    await prefs.setString('todos', jsonEncode(todosJson));
  }

  Future<void> loadToDos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosString = prefs.getString('todos');
    if (todosString != null) {
      final todosJson = jsonDecode(todosString) as List<dynamic>;
      _todos = todosJson.map((json) => ToDo.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
