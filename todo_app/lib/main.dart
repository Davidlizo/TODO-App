import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/todo/screens/add_todo-screen.dart';
import 'features/todo/screens/favourite_screen.dart';
import 'features/todo/screens/homescreen.dart';
import 'features/todo/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToDoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/add': (context) => const AddToDoScreen(),
          '/favorites': (context) => const FavoritesScreen(),
        },
      ),
    );
  }
}
