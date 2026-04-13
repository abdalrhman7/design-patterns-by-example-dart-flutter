/// Existing gateway that the old checkout system was built around.
/// This was there BEFORE any new provider was introduced.
class LegacyBankGateway {
  void chargeInCents(int cents) {
    print('LegacyBank: charged $cents cents');
  }
}

/// New third-party SDK with an incompatible interface.
/// It does not match the method shape used by [CheckoutService].
class QuickPaySdk {
  void createTransaction({
    required String totalAmount,
    required String currency,
    required String customerRef,
  }) {
    print('QuickPay: charged $totalAmount $currency for $customerRef');
  }
}

/// Existing client/service (legacy code).
/// Originally it only knew [LegacyBankGateway.chargeInCents].
///
/// Without Adapter, we "patch" it to support QuickPay directly,
/// which introduces mismatch handling and provider branching here.
class CheckoutService {
  final LegacyBankGateway _legacyBank = LegacyBankGateway();
  final QuickPaySdk _quickPay = QuickPaySdk();

  String _provider = 'legacy_bank';

  void setProvider(String provider) {
    _provider = provider;
  }

  void pay(double amountInDollars, String customerId) {
    if (_provider == 'legacy_bank') {
      // Old flow this class was designed for.
      final cents = (amountInDollars * 100).round();
      _legacyBank.chargeInCents(cents);
    } else if (_provider == 'quick_pay') {
      // Problem 1: Incompatibility mapping now leaks into client code.
      // QuickPay expects different parameter names/types/formats.
      _quickPay.createTransaction(
        totalAmount: amountInDollars.toStringAsFixed(2),
        currency: 'USD',
        customerRef: 'CUST-$customerId',
      );
    } else {
      print('Provider not supported');
    }

    // Problem 2: Tight coupling and growing conditionals.
    // Every new provider forces edits in this existing class.
    // This makes the legacy client less stable over time.
  }
}
