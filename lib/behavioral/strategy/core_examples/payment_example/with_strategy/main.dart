
import 'package:design_patterns_flutter/behavioral/strategy/core_examples/payment_example/with_strategy/payment_strategy.dart';

void main() {
  ShoppingCart cart = ShoppingCart();

  // Strategy 1: Pay with Credit Card
  cart.setPaymentStrategy(CreditCardPayment());
  cart.checkout(100.0); // Output: Paid $100.0 using Credit Card

  // Strategy 2: Pay with PayPal
  cart.setPaymentStrategy(PayPalPayment());
  cart.checkout(200.0); // Output: Paid $200.0 using PayPal

  // 🔹 Open for extension:
  // You can add ApplePay, GooglePay, etc. with no changes in ShoppingCart
}