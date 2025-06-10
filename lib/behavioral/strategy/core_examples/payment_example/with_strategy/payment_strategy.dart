// Strategy Interface
// 🔹 Code to an interface, not an implementation
// We depend on abstraction here, not a concrete class
// This makes the design flexible and extensible
abstract class PaymentStrategy {
  void pay(double amount);
}

// Concrete Strategy 1: Credit Card Payment
// 🔹 Each strategy encapsulates its own behavior
// This follows the principle: Encapsulate what varies
class CreditCardPayment implements PaymentStrategy {
  @override
  void pay(double amount) {
    print('Paid $amount using Credit Card');
  }
}

// Concrete Strategy 2: PayPal Payment
// 🔹 Each strategy encapsulates its own behavior
// This follows the principle: Encapsulate what varies
class PayPalPayment implements PaymentStrategy {
  @override
  void pay(double amount) {
    print('Paid $amount using PayPal');
  }
}

// Context: The class that uses the Strategy
class ShoppingCart {
  late PaymentStrategy _paymentStrategy;

  // 🔹 Favor composition over inheritance
  // Instead of inheriting behavior, we inject it (composition)
  // This makes the system more flexible

  // 🔹 Open/Closed Principle (SOLID)
  // We can add new payment strategies (e.g., ApplePay, GooglePay)
  // without modifying this class at all

  void setPaymentStrategy(PaymentStrategy strategy) {
    _paymentStrategy = strategy;
  }

  void checkout(double amount) {
    _paymentStrategy.pay(amount);

    // 🔹 Polymorphism in action:
    // We call 'pay' on an abstract type,
    // and the correct implementation runs at runtime
  }
}



