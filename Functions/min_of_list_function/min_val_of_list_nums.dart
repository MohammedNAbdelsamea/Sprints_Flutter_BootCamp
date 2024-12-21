void main() {
  // List of integers
  List<int> numbers = [10, 22, 5, 3, 99, 2, -5, 0];

  // Call the function to find the minimum value
  int minValue = getMinimumValue(numbers);

  // Print the result
  print("The list of numbers: $numbers");
  print("The minimum value in the list is: $minValue");
}

// Function to find the minimum value in a list of integers
int getMinimumValue(List<int> numbers) {
  if (numbers.isEmpty) {
    throw ArgumentError("The list cannot be empty.");
  }

  int minValue = numbers[0]; // Initialize with the first value
  for (int number in numbers) {
    if (number < minValue) {
      minValue = number; // Update the minimum value if a smaller number is found
    }
  }
  return minValue;
}
