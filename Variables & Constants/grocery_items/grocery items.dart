// Constant tax rate (10%)
const double TAX_RATE = 0.10;

void main() {
  // List of grocery items with their names and prices
  List<Map<String, dynamic>> groceryItems = [
    {"name": "Apple", "price": 3.00},
    {"name": "Milk", "price": 2.50},
    {"name": "Bread", "price": 1.75},
    {"name": "Eggs", "price": 4.00},
  ];

  // Calculate the subtotal, tax, and total price
  double subtotal = calculateSubtotal(groceryItems);
  double tax = subtotal * TAX_RATE;
  double totalPrice = subtotal + tax;

  // Print results
  printResults(subtotal, tax, totalPrice);
}

// Function to calculate the subtotal price of grocery items
double calculateSubtotal(List<Map<String, dynamic>> items) {
  double subtotal = 0.0;
  for (var item in items) {
    subtotal += item["price"];
  }
  return subtotal;
}

// Function to print results clearly
void printResults(double subtotal, double tax, double total) {
  print("==== Grocery Items Total Cost ====");
  print("Subtotal (Before Tax): \$${subtotal.toStringAsFixed(2)}");
  print("Tax (10%): \$${tax.toStringAsFixed(2)}");
  print("Total (After Tax): \$${total.toStringAsFixed(2)}");
}
