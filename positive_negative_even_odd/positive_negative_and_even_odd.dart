import 'dart:io';

void main() {
  // Prompt the user to enter an integer
  print("Enter any integer number: ");

  // Read input from the user and parse it into an integer
  int number = int.parse(stdin.readLineSync()!);

  // Check if the number is positive, negative, or zero
  if (number > 0) {
    print("The number $number is Positive.");
  } else if (number < 0) {
    print("The number $number is Negative.");
  } else {
    print("The number $number is Zero.");
  }

  // Check if the number is even or odd
  print((number % 2 == 0) ? "The number $number is Even." : "The number $number is Odd.");

}