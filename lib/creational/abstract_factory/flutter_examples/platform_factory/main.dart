import 'package:design_patterns_flutter/creational/abstract_factory/flutter_examples/platform_factory/ui/platform_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PlatformWidgetsApp());
}

class PlatformWidgetsApp extends StatelessWidget {
  const PlatformWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abstract Factory: Platform Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlatformScreen(),
    );
  }
}
