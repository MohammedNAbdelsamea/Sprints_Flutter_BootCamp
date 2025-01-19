import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// Include part files for events and states
part 'theme_event.dart';
part 'theme_state.dart';

// ThemeBloc: Manages the application's theme state
// Handles switching between light and dark themes
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  // Constructor
  // Initializes with light theme (isDark: false)
  // super(ThemeInitial(false)) sets the initial theme state
  ThemeBloc() : super(ThemeInitial(false)) {
    // Register event handler for theme toggle
    on<ToggleTheme>((event, emit) {
      // Get current theme state
      final currentState = state as ThemeInitial;

      // Emit new state with opposite theme value
      // If current is dark (!true = false) -> switch to light
      // If current is light (!false = true) -> switch to dark
      emit(ThemeInitial(!currentState.isDark));
    });
  }
}