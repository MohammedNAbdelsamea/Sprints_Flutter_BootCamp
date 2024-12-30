
# Get Minimum Value from a List of Numbers

## Description
This Dart program provides functionality to find the minimum value in a list of integers. It supports two modes:
1. Use a predefined list of numbers.
2. Allow the user to input a custom list of numbers.  
The program iterates through the list, compares each number, and returns the smallest value. It also validates the input to handle invalid or empty lists gracefully.

---

## Features
- **Functionality**:
  - Accepts a predefined list or allows user input.
  - Finds and returns the smallest number in the list.
  - Validates input to handle edge cases like empty or invalid lists.
  - Provides user-friendly prompts for input selection.

- **Modes of Input**:
  1. Predefined List: The program uses a predefined list such as `[1, 5, -2, 99, 0]`.
  2. Custom Input: The user can enter a list of numbers in a comma-separated format (e.g., `1, 3, 5, 0, -8, -7`).

- **Output Example**:
  - For the predefined list `[1, 5, -2, 99, 0]`, the output is:
    ```
    The minimum value in the list is: -2
    ```
  - For custom input `1, 3, 5, 0, -8, -7`, the output is:
    ```
    The minimum value in the list is: -8
    ```

---

## How to Use
1. **Run the Program**:
   Execute the Dart file using a Dart-enabled IDE or terminal:
   ```bash
   dart run main.dart
   ```

2. **Choose Input Mode**:
   - Select between the predefined list or entering a custom list when prompted.

3. **Enter Custom List** (if selected):
   - Enter integers separated by commas (e.g., `1,2,3,-4,5`).

4. **View Result**:
   - The program outputs the minimum value from the provided list.

---

## Code Structure
- **Main Function**:
  - Prompts the user to choose between predefined or custom input.
  - Displays the minimum value based on the selected input.

- **`findMinVal` Function**:
  - Accepts a list of integers as input.
  - Iterates through the list to find and return the smallest value.

---


```

---

## Error Handling
- The program validates user input and handles:
  - **Empty Lists**: Displays an error message and exits.
  - **Invalid Input**: Ignores non-integer values and prompts for valid input.

---

