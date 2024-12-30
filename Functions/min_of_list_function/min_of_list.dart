import 'dart:io';

void main() {
  // Predefined list
  List<int> myList = [3, 10, -2, 7, 0];

  // Ask the user for input choice
  print('Choose an option:');
  print('1. Use predefined list: $myList');
  print('2. Enter your own list of integers (e.g., 1,2,3,-4,5):');
  String? choice = stdin.readLineSync();

  List<int> numbers;

  if (choice == '1') {
    // Use the predefined list
    numbers = myList;
  } else if (choice == '2') {
    // Prompt user to enter their list
    print('Enter a list of integers separated by commas:');
    String? input = stdin.readLineSync();
    numbers = input
        ?.split(',')
        .map((e) => int.parse(e.trim()))
        .toList() ?? [];
  } else {
    print('Invalid choice. Exiting...');
    return;
  }

  // Find the minimum value in the list
  int minimumValOfList = findMinVal(numbers);

  // Print the minimum value
  print('The minimum value in the list is: $minimumValOfList');
}

int findMinVal(List<int> numbers) {
  // Initialize the smallest value as the first element in the list
  var smallestValue = numbers[0];

  // Loop through the list
  for (var i = 1; i < numbers.length; i++) {
    // Check for the smallest value in the list
    if (numbers[i] < smallestValue) {
      smallestValue = numbers[i];
    }
  }

  // Return the smallest value
  return smallestValue;
}
