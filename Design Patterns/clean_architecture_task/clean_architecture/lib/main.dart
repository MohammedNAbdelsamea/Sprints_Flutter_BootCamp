// main.dart
import 'package:clean_architecture/dependency_injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection_container.dart' as di;
import 'presentation/pages/task_page.dart';
import 'presentation/viewmodels/task_cubit.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.getIt<TaskCubit>()..fetchTasks(),
      child: MaterialApp(
        title: 'Task App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TaskPage(),
      ),
    );
  }
}