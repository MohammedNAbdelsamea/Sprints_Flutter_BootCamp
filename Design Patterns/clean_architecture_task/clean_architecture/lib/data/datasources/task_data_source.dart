
import 'package:clean_architecture/data/models/task_model.dart';

abstract class TaskDataSource {
  Future<List<TaskModel>> getTasks();
}

class TaskDataSourceImpl implements TaskDataSource {
  @override
  Future<List<TaskModel>> getTasks() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Return mock data
    return [
      TaskModel(id: 1, title: 'Complete project', isCompleted: true),
      TaskModel(id: 2, title: 'Review code', isCompleted: true),
      TaskModel(id: 3, title: 'Update documentation', isCompleted: false),
    ];
  }
}