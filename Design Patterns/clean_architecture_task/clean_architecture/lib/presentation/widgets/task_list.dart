
import 'package:clean_architecture/domain/entities/task_entity.dart';

import 'package:flutter/material.dart';



class TaskList extends StatelessWidget {
  final List<TaskEntity> tasks;

  const TaskList({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(task.title),
          trailing: Icon(
            task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
          ),
        );
      },
    );
  }
}