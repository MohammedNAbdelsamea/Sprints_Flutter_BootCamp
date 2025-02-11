// PaymentMethod Interface (Abstraction)
abstract class PaymentMethod {
  void pay(double amount); // Single method for payment
}

// CashPayment Class (Implements PaymentMethod)
class CashPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid \$$amount using Cash."); // SRP: Handles cash payment logic
  }
}

// CreditPayment Class (Implements PaymentMethod)
class CreditPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid \$$amount using Credit Card."); // SRP: Handles credit card payment logic
  }
}

// PaymentProcessor Class (High-Level Module)
class PaymentProcessor {
  final PaymentMethod paymentMethod; // DIP: Depends on abstraction (PaymentMethod)

  PaymentProcessor(this.paymentMethod);

  void processPayment(double amount) {
    paymentMethod.pay(amount); // SRP: Handles payment processing
  }
}

// PayPalPayment Class (New Payment Method - Demonstrates OCP)
class PayPalPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid \$$amount using PayPal."); // OCP: New payment method added without modifying existing code
  }
}

void main() {
  // Create payment methods
  PaymentMethod cashPayment = CashPayment(); // LSP: Can be substituted for PaymentMethod
  PaymentMethod creditPayment = CreditPayment(); // LSP: Can be substituted for PaymentMethod
  PaymentMethod payPalPayment = PayPalPayment(); // OCP: New payment method

  // Process payments
  PaymentProcessor cashProcessor = PaymentProcessor(cashPayment);
  cashProcessor.processPayment(100.0); // Output: Paid $100.0 using Cash.

  PaymentProcessor creditProcessor = PaymentProcessor(creditPayment);
  creditProcessor.processPayment(200.0); // Output: Paid $200.0 using Credit Card.

  PaymentProcessor payPalProcessor = PaymentProcessor(payPalPayment);
  payPalProcessor.processPayment(300.0); // Output: Paid $300.0 using PayPal.
}