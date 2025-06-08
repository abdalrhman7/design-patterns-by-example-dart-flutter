


import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/text_style_strategy/text_style_strategy.dart';
import 'package:flutter/material.dart';

/// Context: The widget that uses the TextStyleStrategy
/// 🔹 Favor composition over inheritance
/// We inject the strategy rather than subclassing Text widgets.
class StyledText extends StatelessWidget {
  final String text;
  final TextStyleStrategy textStyleStrategy;

  const StyledText({
    required this.text,
    required this.textStyleStrategy,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // 🔹 Polymorphism in action:
    // strategy.apply(...) picks the correct implementation at runtime
    final style = textStyleStrategy.apply(
      Theme.of(context).textTheme.headlineSmall!,
    );
    return Text(text, style: style);
  }
}
