import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskDetailPage extends StatelessWidget {
  final String taskTitle;
  final String taskContent;
  final String dueDateTime;

  TaskDetailPage({
    required this.taskTitle,
    required this.taskContent,
    required this.dueDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$taskTitle',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '$taskContent',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Due Date and Time: $dueDateTime',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

