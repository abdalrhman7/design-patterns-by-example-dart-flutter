import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';
import 'package:design_patterns_flutter/structural/adapter/flutter_examples/payment_gateway_adapter/payment_gateway_adapter.dart';
import 'package:flutter/material.dart';

class PaymentGatewayAdapterScreen extends StatefulWidget {
  const PaymentGatewayAdapterScreen({super.key});

  @override
  State<PaymentGatewayAdapterScreen> createState() => _PaymentGatewayAdapterScreenState();
}

class _PaymentGatewayAdapterScreenState extends State<PaymentGatewayAdapterScreen> {
  final _amountController = TextEditingController(text: '25.50');
  final _customerController = TextEditingController(text: 'u-100');

  late CheckoutService _checkout;
  String _selectedGateway = 'legacy';
  String _lastResult = 'No transaction yet.';

  @override
  void initState() {
    super.initState();
    _checkout = CheckoutService(LegacyBankGateway());
  }

  @override
  void dispose() {
    _amountController.dispose();
    _customerController.dispose();
    super.dispose();
  }

  void _switchGateway(String value) {
    setState(() {
      _selectedGateway = value;
      if (value == 'legacy') {
        _checkout = CheckoutService(LegacyBankGateway());
      } else {
        _checkout = CheckoutService(QuickPayAdapter(QuickPaySdk()));
      }
    });
  }

  void _payNow() {
    final amount = double.tryParse(_amountController.text.trim());
    final customerId = _customerController.text.trim();

    if (amount == null || customerId.isEmpty) {
      setState(() {
        _lastResult = 'Please enter a valid amount and customer id.';
      });
      return;
    }

    setState(() {
      _lastResult = _checkout.pay(amount, customerId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adapter Pattern: Payment Gateway')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Choose provider implementation'),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment<String>(
                value: 'legacy',
                label: Text('LegacyBank'),
                icon: Icon(Icons.account_balance_outlined),
              ),
              ButtonSegment<String>(
                value: 'quickpay',
                label: Text('QuickPay via Adapter'),
                icon: Icon(Icons.swap_horiz),
              ),
            ],
            selected: <String>{_selectedGateway},
            onSelectionChanged: (selection) => _switchGateway(selection.first),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedGateway == 'legacy'
                ? 'LegacyBank implements the target interface directly.'
                : 'QuickPay uses an adapter that translates then delegates.',
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Amount (USD)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _customerController,
            decoration: const InputDecoration(
              labelText: 'Customer ID',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: _payNow,
            icon: const Icon(Icons.payment),
            label: const Text('Pay'),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              title: const Text('Transaction result'),
              subtitle: Text(_lastResult),
            ),
          ),
          const PatternDefinitionCard(
            title: 'Adapter Pattern',
            description:
                'Converts one interface into another interface clients expect, so incompatible classes can work together.',
            exampleContext:
                'CheckoutService still calls chargeInCents(...). QuickPayAdapter converts cents to QuickPay format then delegates to QuickPaySdk without changing checkout logic.',
          ),
        ],
      ),
    );
  }
}
