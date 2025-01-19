part of 'counter_cubit.dart';


@immutable
sealed class CounterState {
  /// Current counter value
  final int count;

  /// Optional message for milestone notifications
  final String message;

  /// Constructor for CounterState with count and optional message
  const CounterState({
    required this.count,
    this.message = '',
  });
}

/// Initial state of the counter, starts with count = 0

final class CounterInitial extends CounterState {
  // const Constructor for immutability and calls super with count: 0

  const CounterInitial() : super(count: 0);
}

/// State class for all non-initial counter values
/// Used after any increment/decrement operations
final class CounterValue extends CounterState {

  const CounterValue({required super.count, super.message});
}