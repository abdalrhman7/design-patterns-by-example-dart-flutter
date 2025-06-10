import 'package:design_patterns_flutter/behavioral/strategy/core_examples/payment_example/without_pattern/payment_without_strategy.dart';

// === Usage Without Strategy Pattern ===
void main() {
  ShoppingCart cart = ShoppingCart();

  // Using credit card payment
  cart.setPaymentMethod('credit_card');
  cart.checkout(100.0); // Output: Paid $100.0 using Credit Card

  // Switching to PayPal payment
  cart.setPaymentMethod('paypal');
  cart.checkout(200.0); // Output: Paid $200.0 using PayPal

  // What if we want to support Apple Pay later?
  // We’ll need to modify the `checkout()` method again.
}