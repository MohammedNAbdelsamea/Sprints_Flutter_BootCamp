# Task 3: Check if a Number is Positive or Negative and Even or Odd

## Description
This Dart program checks whether a user-entered integer is:
1. **Positive**, **Negative**, or **Zero**.
2. **Even** or **Odd**.

It uses **conditions** (`if-else`) and the modulo operator (`%`) to determine the properties of the number.

---

## How It Works
1. The program prompts the user to enter any integer.
2. It first checks:
   - If the number is greater than `0`, it is **Positive**.
   - If the number is less than `0`, it is **Negative**.
   - If the number is equal to `0`, it is **Zero**.
3. Then, it checks whether the number is **Even** or **Odd** using:
   - `number % 2 == 0` → Even.
   - Else → Odd.
4. The results are printed to the console.