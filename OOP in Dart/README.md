# BankAccount Class in Dart

## Description
This program implements a **BankAccount** class in Dart, allowing basic banking operations such as deposits, withdrawals, and displaying account information. The class includes two constructors and methods to ensure the requirements are met.

---

## Features

1. **Class Variables**:
   - `accountID`: A unique identifier for the account.
   - `balance`: The current balance of the account.

2. **Constructors**:
   - **Default Constructor**:
     - Accepts `accountID` and initializes `balance` to `0`.
   - **Named Constructor**:
     - Accepts `accountID` and optionally allows initialization of `balance` (default is `0`).

3. **Methods**:
   - `deposit(double amount)`: Adds a positive amount to the balance.
   - `withdraw(double amount)`: Deducts a valid amount if sufficient balance exists; otherwise, displays an error.
   - `displayAccountInfo()`: Displays the account ID and the current balance.

4. **Main Function**:
   - Demonstrates different scenarios, including valid deposits and withdrawals, insufficient balance, and invalid inputs.

---


