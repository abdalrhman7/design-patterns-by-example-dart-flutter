import 'package:design_patterns_flutter/structural/decorator/flutter_examples/pizza_decorator/ui/decorator_pizza_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PizzaApp());
}

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Decorator Pattern: Pizza',
      home: const DecoratorPizzaScreen(),
    );
  }
}
