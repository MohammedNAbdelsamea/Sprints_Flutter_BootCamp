import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

//CounterBloc handles the business logic for counter operations
// Extends Bloc with CounterEvent as input and CounterState as output
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Constructor initializes the bloc with an initial state
  //super(CounterInitial(0)) sets the initial counter value to 0
  CounterBloc() : super(CounterInitial(0)) {
    // Register event handler for increment operation
    on<IncrementCounter>((event, emit) {
      // Cast the current state to access the count property
      final currentState = state as CounterInitial;

      // Emit new state with incremented count
      // This will trigger UI updates in all listening widgets
      emit(CounterInitial(currentState.count + 1));
    });

    // Register event handler for decrement operation
    on<DecrementCounter>((event, emit) {
      // Cast the current state to access the count property
      final currentState = state as CounterInitial;

      // Emit new state with decremented count
      // This will trigger UI updates in all listening widgets
      emit(CounterInitial(currentState.count - 1));
    });
  }}