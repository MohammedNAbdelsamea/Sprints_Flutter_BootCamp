import 'package:clean_architecture/domain/entities/task_entity.dart';

import '../../domain/repositories/task_repository.dart';
import '../datasources/task_data_source.dart';


class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource dataSource;

  TaskRepositoryImpl(this.dataSource);

  @override
  Future<List<TaskEntity>> getTasks() async {
    return await dataSource.getTasks();
  }
}