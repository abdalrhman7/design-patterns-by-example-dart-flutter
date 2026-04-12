import 'package:design_patterns_flutter/behavioral/command/flutter_examples/counter_undo/ui/counter_undo_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CounterUndoApp());
}

class CounterUndoApp extends StatelessWidget {
  const CounterUndoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Command Pattern: Counter & Undo',
      home: const CounterUndoScreen(),
    );
  }
}
