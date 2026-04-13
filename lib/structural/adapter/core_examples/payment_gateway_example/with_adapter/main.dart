import 'package:design_patterns_flutter/structural/adapter/core_examples/payment_gateway_example/with_adapter/payment_with_adapter.dart';

void main() {
  // Existing flow still works with old gateway.
  final legacyCheckout = CheckoutService(LegacyBankGateway());
  legacyCheckout.pay(25.50, 'u-100'); // LegacyBank: charged 2550 cents for u-100

  // New provider now works through an adapter, without changing CheckoutService.
  final quickPayCheckout = CheckoutService(
    QuickPayAdapter(QuickPaySdk()),
  );
  quickPayCheckout.pay(40.00, 'u-200'); // QuickPay: charged 40.00 USD for CUST-u-200

  // 🔹 The client calls the same method shape in both cases:
  // chargeInCents(cents, customerId)
  // Adapter handles the mismatch + delegates to QuickPaySdk.
}
