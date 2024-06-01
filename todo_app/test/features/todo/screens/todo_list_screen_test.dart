import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/models/todo.dart';

void main() {
  group('ToDo', () {
    test('isOverdue returns true for past due date', () {
      final overdueTodo = ToDo(
        id: '1',
        title: 'Overdue Task',
        dueDate: DateTime(2024, 05, 20), // Set a past date
      );
      expect(overdueTodo.isOverdue(), true);
    });

    test('isOverdue returns false for future due date', () {
      final futureTodo = ToDo(
        id: '2',
        title: 'Future Task',
        dueDate: DateTime.now().add(Duration(days: 1)), // Set a future date
      );
      expect(futureTodo.isOverdue(), false);
    });
  });
}