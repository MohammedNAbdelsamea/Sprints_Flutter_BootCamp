
import 'package:get_it/get_it.dart';
import 'data/datasources/task_data_source.dart';
import 'data/repositories/task_repository_impl.dart';
import 'domain/repositories/task_repository.dart';
import 'domain/usecases/get_tasks_usecase.dart';
import 'presentation/viewmodels/task_cubit.dart';



final getIt = GetIt.instance;

void init() {
  // Cubit
  getIt.registerFactory(
        () => TaskCubit(getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(
        () => GetTasksUseCase(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<TaskRepository>(
        () => TaskRepositoryImpl(getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<TaskDataSource>(
        () => TaskDataSourceImpl(),
  );
}