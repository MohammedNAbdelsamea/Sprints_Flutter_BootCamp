import 'package:different_types_of_blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc/counter_bloc.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // MultiBlocProvider allows us to provide multiple BLoCs to the widget tree
      providers: [
        // Provide CounterBloc instance
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        // Provide ThemeBloc instance
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      // BlocBuilder listens to ThemeBloc state changes
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          // Cast the state to ThemeInitial to access isDark property
          final themeState = state as ThemeInitial;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // Dynamically switch between light and dark theme based on ThemeBloc state
            theme: themeState.isDark
                ? ThemeData.dark()  // Apply dark theme when isDark is true
                : ThemeData.light(), // Apply light theme when isDark is false
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}