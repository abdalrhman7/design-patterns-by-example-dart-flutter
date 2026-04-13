import 'package:design_patterns_flutter/structural/adapter/flutter_examples/payment_gateway_adapter/ui/payment_gateway_adapter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PaymentGatewayAdapterApp());
}

class PaymentGatewayAdapterApp extends StatelessWidget {
  const PaymentGatewayAdapterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adapter Pattern: Payment Gateway',
      home: const PaymentGatewayAdapterScreen(),
    );
  }
}
