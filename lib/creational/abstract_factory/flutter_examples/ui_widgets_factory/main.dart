import 'package:design_patterns_flutter/creational/abstract_factory/flutter_examples/ui_widgets_factory/ui/PlatformScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const UIWidgetsApp());
}

class UIWidgetsApp extends StatelessWidget {
  const UIWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abstract Factory: UI Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WidgetsScreen(),
    );
  }
}
