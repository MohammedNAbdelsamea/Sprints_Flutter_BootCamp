
import 'package:clean_architecture/domain/entities/task_entity.dart';


class TaskModel extends TaskEntity {
  TaskModel({
    required int id,
    required String title,
    required bool isCompleted,
  }) : super(
    id: id,
    title: title,
    isCompleted: isCompleted,
  );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      isCompleted: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': isCompleted,
    };
  }
}