# Different Types of BLoCs Demo

A Flutter application demonstrating the implementation and usage of different types of BLoC (Business Logic Component) patterns and widgets.

## 🎯 Features

- Counter functionality with BLoC pattern
- Theme switching (Light/Dark) using BLoC
- Different BLoC widgets demonstration:
    - BlocBuilder
    - BlocListener
    - BlocConsumer

## 🛠️ Technical Implementation

### BLoCs
1. **CounterBloc**
    - Manages counter state
    - Handles increment/decrement operations
    - Shows SnackBar notifications at specific values (5 and 10)

2. **ThemeBloc**
    - Manages application theme state
    - Toggles between light and dark themes
    - Dynamic theme-based icon switching

### BLoC Widgets Used

```dart
// BlocListener: For side effects (SnackBar notifications)
BlocListener<CounterBloc, CounterState>(
  listener: (context, state) {
    // Handle side effects
  },
)

// BlocBuilder: For UI updates
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) {
    // Build UI based on state
  },
)

// BlocConsumer: Combines listener and builder
BlocConsumer<CounterBloc, CounterState>(
  listener: (context, state) {
    // Handle side effects
  },
  builder: (context, state) {
    // Build UI based on state
  },
)