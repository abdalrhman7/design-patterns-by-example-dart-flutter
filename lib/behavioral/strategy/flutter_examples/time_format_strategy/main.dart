import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/text_style_strategy/ui/text_styling_screen.dart';
import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/time_format_strategy/ui/time_display_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TextStylingApp());
}

class TextStylingApp extends StatelessWidget {
  const TextStylingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strategy Pattern: Text Styling',
      home: const TimeDisplayScreen(),
    );
  }
}