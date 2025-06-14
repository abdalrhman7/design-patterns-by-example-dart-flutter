import 'package:design_patterns_flutter/creational/factory_method/flutter_examples/ui/factory_method_dialog_example.dart';
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
      home: const FactoryMethodDialogExample(),
    );
  }
}
