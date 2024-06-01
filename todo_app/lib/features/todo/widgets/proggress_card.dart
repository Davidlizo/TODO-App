import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/screens/add_todo-screen.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final int completed;
  final int total;
  final Color color;
  final Color progressColor;

  const ProgressCard({
    Key? key,
    required this.title,
    required this.completed,
    required this.total,
    required this.color,
    required this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = (completed / total) * 100;

    return Container(
      width: 150,
      // padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$completed/$total Completed',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 13),
          Stack(
            children: [
              Container(
                width: 85,
                height: 85,
                child: CircularProgressIndicator(
                  value: progress / 100,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation(progressColor),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text('${progress.toStringAsFixed(1)}%'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: () {
                 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddToDoScreen()),
            );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Row(
                children: [Icon(Icons.add_box_outlined,color: Colors.black,), SizedBox(width: 3.0,), Text('Add To Do', style: TextStyle(color: Colors.black),)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
