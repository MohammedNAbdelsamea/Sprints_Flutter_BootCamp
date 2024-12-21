// BankAccount class to handle deposits, withdrawals, and account information
class BankAccount {
  // Account ID and balance variables
  String accountID;
  double balance;

  // Constructor to initialize account ID with default balance 0
  BankAccount(this.accountID) : balance = 0;

  // Named constructor to initialize balance (default to 0) with accountID
  BankAccount.withInitialBalance(this.accountID, {this.balance = 0});



  // Method to withdraw money
  void withdraw(double amount) {
    if (amount <= 0) {
      print("Withdrawal amount must be positive.");
    } else if (amount > balance) {
      print("Insufficient balance for withdrawal of \$${amount.toStringAsFixed(2)}.");
    } else {
      balance -= amount;
      print("Withdrew \$${amount.toStringAsFixed(2)} successfully.");
    }
  }


  // Method to deposit money
  void deposit(double amount) {
    if (amount <= 0) {
      print("Deposit amount must be positive.");
      return;
    }
    balance += amount;
    print("Deposited \$${amount.toStringAsFixed(2)} successfully.");
  }



  // Method to display account information
  void displayAccountInfo() {
    print("Account ID: $accountID");
    print("Current Balance: \$${balance.toStringAsFixed(2)}");
  }
}

void main() {
  // Scenario 1: Using the default constructor
  print("Scenario 1: Default Constructor");
  BankAccount account1 = BankAccount("A12345");
  account1.displayAccountInfo();
  account1.deposit(500);
  account1.withdraw(200);
  account1.withdraw(400); // Insufficient balance scenario
  account1.deposit(-50);  // Invalid deposit
  account1.displayAccountInfo();

  print("\nScenario 2: Named Constructor with Initial Balance");
  // Scenario 2: Using the named constructor
  BankAccount account2 = BankAccount.withInitialBalance("B67890", balance: 1000);
  account2.displayAccountInfo();
  account2.withdraw(300);
  account2.deposit(200);
  account2.withdraw(1200); // Insufficient balance scenario
  account2.displayAccountInfo();
}
