import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain/entities/task_entity.dart';
import 'package:clean_architecture/domain/usecases/get_tasks_usecase.dart';


part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final GetTasksUseCase getTasksUseCase;

  TaskCubit(this.getTasksUseCase) : super(TaskInitial());

  Future<void> fetchTasks() async {
    emit(TaskLoading());
    try {
      final tasks = await getTasksUseCase();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }
}
