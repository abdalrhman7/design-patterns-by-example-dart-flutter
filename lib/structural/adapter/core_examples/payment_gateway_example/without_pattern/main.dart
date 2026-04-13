import 'package:design_patterns_flutter/structural/adapter/core_examples/payment_gateway_example/without_pattern/payment_without_adapter.dart';

// === Usage Without Adapter Pattern ===
void main() {
  final checkout = CheckoutService();

  checkout.setProvider('legacy_bank');
  checkout.pay(25.50, 'u-100'); // LegacyBank: charged 2550 cents

  checkout.setProvider('quick_pay');
  checkout.pay(40.00, 'u-200'); // QuickPay: charged 40.00 USD for CUST-u-200

  // Pain point:
  // CheckoutService was originally built for LegacyBank only.
  // After adding QuickPay, compatibility mapping + provider branching
  // now lives inside this legacy client class.
}
