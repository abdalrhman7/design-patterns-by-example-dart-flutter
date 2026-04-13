import 'package:design_patterns_flutter/structural/adapter/flutter_examples/charger_adapter/ui/charger_adapter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChargerAdapterApp());
}

class ChargerAdapterApp extends StatelessWidget {
  const ChargerAdapterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adapter Pattern: Charger',
      home: const ChargerAdapterScreen(),
    );
  }
}
