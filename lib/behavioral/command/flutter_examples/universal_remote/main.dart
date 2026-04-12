import 'package:design_patterns_flutter/behavioral/command/flutter_examples/universal_remote/ui/universal_remote_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const UniversalRemoteApp());
}

class UniversalRemoteApp extends StatelessWidget {
  const UniversalRemoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Command Pattern: Universal Remote',
      home: const UniversalRemoteScreen(),
    );
  }
}
