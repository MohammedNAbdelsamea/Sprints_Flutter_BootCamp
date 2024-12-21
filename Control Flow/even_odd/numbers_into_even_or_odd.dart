void main() {
  // List of numbers to categorize
  List<int> numbers = [10, 15, 22, 33, 40, 55, 66, 77];

  print("==== Number Categorization: Even or Odd ====");

  // Iterate through each number in the list
  for (int number in numbers) {
    // Check whether the number is even or odd using switch
    switch (number % 2) {
      case 0:
        print("Number $number is Even");
        break;
      case 1:
      case -1: // Handles negative numbers
        print("Number $number is Odd");
        break;
      default:
        print("Invalid number: $number");
    }
  }
}