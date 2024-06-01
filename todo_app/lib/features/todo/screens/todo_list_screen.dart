import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/todo/widgets/my_textfield.dart';
import '../todo_provider.dart';
import '../widgets/tab_views/done_tabview.dart';
import '../widgets/tab_views/planning_tabview.dart';
import '../widgets/profile_container.dart';
import '../widgets/tab_views/to_do_tabview.dart';
class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<ToDoProvider>(context);

    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: const [ProfileContainer()],
            title: const MyTextField(hintText: 'To do, Task, Plan...'),
            bottom: const TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: 'To Do'),
                Tab(text: 'Planning'),
                Tab(text: 'Done'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // To Do Tab
              SingleChildScrollView(
                child: ToDoTabView(todoProvider: todoProvider),
              ),

              // Planning Tab (Overdue Tasks / planning)
              SingleChildScrollView(
                child: PlanningTabView(todoProvider: todoProvider),
              ),

              // Done Tab
              DoneTabView(todoProvider: todoProvider),
            ],
          ),
        ),
      ),
    );
  }
}