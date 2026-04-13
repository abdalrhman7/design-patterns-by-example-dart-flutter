/// Existing expected interface (Target).
/// Checkout already depends on this contract.
abstract class LegacyPaymentTarget {
  String chargeInCents(int cents, String customerId);
}

/// Existing provider that already matches the old target.
class LegacyBankGateway implements LegacyPaymentTarget {
  @override
  String chargeInCents(int cents, String customerId) {
    return 'LegacyBank: charged $cents cents for $customerId';
  }
}

/// New third-party SDK (Adaptee) with incompatible interface.
class QuickPaySdk {
  String createTransaction({
    required String totalAmount,
    required String currency,
    required String customerRef,
  }) {
    return 'QuickPay: charged $totalAmount $currency for $customerRef';
  }
}

/// Adapter: makes QuickPay behave like the old target.
/// Delegation happens here after converting data/format.
class QuickPayAdapter implements LegacyPaymentTarget {
  final QuickPaySdk _quickPay;

  QuickPayAdapter(this._quickPay);

  @override
  String chargeInCents(int cents, String customerId) {
    final dollars = (cents / 100).toStringAsFixed(2);
    return _quickPay.createTransaction(
      totalAmount: dollars,
      currency: 'USD',
      customerRef: 'CUST-$customerId',
    );
  }
}

/// Existing client/service.
/// It stays unchanged while swapping concrete gateways.
class CheckoutService {
  final LegacyPaymentTarget _gateway;

  CheckoutService(this._gateway);

  String pay(double amountInDollars, String customerId) {
    final cents = (amountInDollars * 100).round();
    return _gateway.chargeInCents(cents, customerId);
  }
}
