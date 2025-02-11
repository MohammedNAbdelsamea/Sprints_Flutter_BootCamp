# SOLID Principles Payment System

## Overview
A demonstration of SOLID principles implementation in a payment processing system using Dart. This project showcases how to create a flexible, maintainable, and extensible payment system following object-oriented design principles.

## SOLID Principles Implementation

### 1. Single Responsibility Principle (SRP)
Each class has a single, well-defined responsibility:
- `CashPayment`: Handles cash payment logic
- `CreditPayment`: Manages credit card payment logic
- `PaymentProcessor`: Processes payments

### 2. Open/Closed Principle (OCP)
The system is:
- Open for extension (new payment methods can be added)
- Closed for modification (existing code doesn't need to change)

### 3. Liskov Substitution Principle (LSP)
All payment method implementations can be substituted for their base type:

- PaymentMethod cashPayment = CashPayment();
- PaymentMethod creditPayment = CreditPayment();

### 4. Interface Segregation Principle (ISP)
 The PaymentMethod interface is small and focused, containing only the pay method.
 Clients are not forced to depend on methods they do not use.

### 5. Dependency Inversion Principle (DIP)
 High-level modules (e.g., PaymentProcessor) depend on abstractions (e.g., PaymentMethod),
 not on low-level modules (e.g., CashPayment, CreditPayment).

### Screenshots
![alt text](image.png)
