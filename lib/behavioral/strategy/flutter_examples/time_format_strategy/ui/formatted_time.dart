import 'package:flutter/material.dart';
import '../time_format_strategy.dart';

/// 🔹 Context: FormattedTime
/// This widget depends on the strategy to determine how to display time.
/// The formatting logic is *delegated* to the strategy object.
class FormattedTime extends StatelessWidget {
  final DateTime time;

  /// 🔹 Composition over Inheritance:
  /// Instead of subclassing this widget for each style,
  /// we inject a different formatting strategy.
  final TimeFormatStrategy formatStrategy;

  const FormattedTime({
    required this.time,
    required this.formatStrategy,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// 🔹 Polymorphism in action:
    /// This line picks the correct strategy implementation at runtime.
    final formatted = formatStrategy.format(time);

    return Text(
      formatted,
      style: TextStyle(fontSize: 26),
    );
  }
}
