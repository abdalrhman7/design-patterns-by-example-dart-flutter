import 'package:design_patterns_flutter/creational/factory_method/flutter_examples/ui/dialog_factory_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DialogFactoryMethodApp());
}

class DialogFactoryMethodApp extends StatelessWidget {
  const DialogFactoryMethodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factory Method : Dialog',
      home: const DialogFactoryScreen(),
    );
  }
}
