import 'package:design_patterns_flutter/creational/singletone/flutter_examples/ui/counter_singletone_screens.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const CounterSingletoneApp());
}

class CounterSingletoneApp extends StatelessWidget {
  const CounterSingletoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Singleton Pattern: Counter',
      home: const CounterFirstScreen(),
    );
  }
}