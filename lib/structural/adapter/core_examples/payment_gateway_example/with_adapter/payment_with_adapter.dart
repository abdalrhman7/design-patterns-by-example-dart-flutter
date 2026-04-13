// Existing expected interface (Target)
// This models the old API shape the checkout system already relies on.
abstract class LegacyPaymentTarget {
  void chargeInCents(int cents, String customerId);
}

// Existing gateway that already matches the old target.
class LegacyBankGateway implements LegacyPaymentTarget {
  @override
  void chargeInCents(int cents, String customerId) {
    print('LegacyBank: charged $cents cents for $customerId');
  }
}

// New third-party SDK (Adaptee) with incompatible interface.
class QuickPaySdk {
  void createTransaction({
    required String totalAmount,
    required String currency,
    required String customerRef,
  }) {
    print('QuickPay: charged $totalAmount $currency for $customerRef');
  }
}

// Adapter: makes QuickPay behave like LegacyPaymentTarget.
// 🔹 Delegation in action:
//    1) Convert chargeInCents(...) input to QuickPay format.
//    2) Delegate real execution to [QuickPaySdk].
class QuickPayAdapter implements LegacyPaymentTarget {
  final QuickPaySdk _quickPay;

  QuickPayAdapter(this._quickPay);

  @override
  void chargeInCents(int cents, String customerId) {
    final dollars = (cents / 100).toStringAsFixed(2);
    _quickPay.createTransaction(
      totalAmount: dollars,
      currency: 'USD',
      customerRef: 'CUST-$customerId',
    );
  }
}

// Existing client/service.
// It now depends only on LegacyPaymentTarget and does not care
// whether the concrete object is the legacy gateway or an adapter.
class CheckoutService {
  final LegacyPaymentTarget _gateway;

  CheckoutService(this._gateway);

  void pay(double amountInDollars, String customerId) {
    final cents = (amountInDollars * 100).round();
    _gateway.chargeInCents(cents, customerId);

    // 🔹 Separation of concerns:
    // Checkout keeps business flow only.
    // Compatibility logic is isolated in adapters.
  }
}
