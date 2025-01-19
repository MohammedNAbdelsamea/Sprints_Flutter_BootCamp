import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Cubit Demo'),
        actions: [
          // Reset button in AppBar
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            // Reset counter to initial state (0)
            onPressed: () => context.read<CounterCubit>().reset(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocListener: Shows dialog only when transitioning from positive to negative
            BlocListener<CounterCubit, CounterState>(
              // Trigger only when crossing from non-negative to negative
              listenWhen: (previous, current) =>
              previous.count >= 0 && current.count < 0,
              listener: (context, state) {
                // Show warning dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Warning'),
                    content: const Text('Counter has gone negative!'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              // Empty container as we only need the listener functionality
              child: const SizedBox(),
            ),

            // Counter label
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),

            // BlocConsumer: Combines listener for messages and builder for UI
            BlocConsumer<CounterCubit, CounterState>(
              // Only listen when there's a message to show
              listenWhen: (previous, current) =>
              current.message.isNotEmpty,
              // Show SnackBar for milestone messages
              listener: (context, state) {
                if (state.message.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              // Build UI for counter display
              builder: (context, state) {
                return Column(
                  children: [
                    // Counter value display
                    Text(
                      '${state.count}',
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Show positive/negative indicator when count is not zero
                    if (state.count != 0)
                      Text(
                        state.count > 0 ? 'Positive' : 'Negative',
                        style: TextStyle(
                          // Green for positive, red for negative
                          color: state.count > 0 ? Colors.green : Colors.red,
                          fontSize: 16,
                        ),
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 40),

            // Control buttons row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Decrement button
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: const Icon(Icons.remove_circle_outline),
                ),
                // Increment button
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}