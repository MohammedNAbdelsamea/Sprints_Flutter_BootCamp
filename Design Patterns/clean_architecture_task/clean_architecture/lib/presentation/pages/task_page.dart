

import 'package:clean_architecture/presentation/viewmodels/task_cubit.dart';
import 'package:clean_architecture/presentation/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TaskError) {
            return Center(child: Text(state.message));
          }

          if (state is TaskLoaded) {
            return TaskList(tasks: state.tasks);
          }

          return const Center(child: Text('No tasks available'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TaskCubit>().fetchTasks();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}