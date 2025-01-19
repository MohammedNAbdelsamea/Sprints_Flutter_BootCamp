import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// Include the state definitions from counter_state.dart
part 'counter_state.dart';

/// CounterCubit class extends Cubit and uses CounterState
class CounterCubit extends Cubit<CounterState> {
// Include the initial state from counter_state.dart
  CounterCubit() : super(const CounterInitial());

  /// Increments the counter value
  /// Checks for milestone (10) and sets appropriate message
  void increment() {
    // Get current state
    final currentState = state;
    // Calculate new count
    final newCount = currentState.count + 1;
    // Initialize empty message
    String message = '';

    // Check for milestone (10)
    if (newCount == 10) {
      message = 'Reached positive milestone: 10!';
    }

    // Emit new state with updated count and message
    emit(CounterValue(
      count: newCount,
      message: message,
    ));
  }

  /// Decrements the counter value
  /// Checks for milestone (-10) and sets appropriate message
  void decrement() {
    // Get current state
    final currentState = state;
    // Calculate new count
    final newCount = currentState.count - 1;
    // Initialize empty message
    String message = '';

    // Check for milestone (-10)
    if (newCount == -10) {
      message = 'Reached negative milestone: -10!';
    }

    // Emit new state with updated count and message
    emit(CounterValue(
      count: newCount,
      message: message,
    ));
  }

  /// Resets the counter to initial state (0)
  /// Uses CounterInitial state which has count = 0
  void reset() {
    emit(const CounterInitial());
  }
}