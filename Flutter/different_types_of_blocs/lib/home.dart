import 'package:different_types_of_blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc/counter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Bloc Demo'),
        actions: [
          // Theme toggle button with dynamic icon
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              final themeState = state as ThemeInitial;
              return IconButton(
                icon: Icon(
                  // Show sun icon in dark mode, moon icon in light mode
                  themeState.isDark ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: () {
                  // Dispatch theme toggle event to ThemeBloc
                  context.read<ThemeBloc>().add(ToggleTheme());
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocListener Example: Only listens for state changes
            // Doesn't rebuild the UI, just performs side effects
            BlocListener<CounterBloc, CounterState>(
              listener: (context, state) {
                final counterState = state as CounterInitial;
                // Show SnackBar when counter hits 5
                if (counterState.count == 5) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Counter reached 5!')),
                  );
                }
              },
              child: const SizedBox(), // Empty container since we only need listener
            ),

            // BlocBuilder Example: Rebuilds UI when state changes
            const Text('Counter Value:'),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                final counterState = state as CounterInitial;
                return Text(
                  '${counterState.count}',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),

            const SizedBox(height: 20),

            // BlocConsumer Example: Combines listener and builder functionality
            // Useful when you need both UI updates and side effects
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                final counterState = state as CounterInitial;
                // Show SnackBar when counter hits 10
                if (counterState.count == 10) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Counter reached 10!')),
                  );
                }
              },
              builder: (context, state) {
                final counterState = state as CounterInitial;
                return Text(
                  'Consumer Value: ${counterState.count}',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Increment button
          FloatingActionButton(
            onPressed: () {
              // send increment event to CounterBloc
              context.read<CounterBloc>().add(IncrementCounter());
            },
            child: const Icon(Icons.add_circle),
          ),
          const SizedBox(height: 10),
          // Decrement button
          FloatingActionButton(
            onPressed: () {
              // send decrement event to CounterBloc
              context.read<CounterBloc>().add(DecrementCounter());
            },
            child: const Icon(Icons.remove_circle_outlined),
          ),
        ],
      ),
    );
  }
}