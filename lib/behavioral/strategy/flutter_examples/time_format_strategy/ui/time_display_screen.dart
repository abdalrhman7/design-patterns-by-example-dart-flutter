import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/time_format_strategy/time_format_strategy.dart';
import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';
import 'package:flutter/material.dart';
import 'formatted_time.dart';

/// 🔹 This screen demonstrates switching between different time formatting strategies.
class TimeDisplayScreen extends StatefulWidget {
  const TimeDisplayScreen({super.key});

  @override
  State<TimeDisplayScreen> createState() => _TimeDisplayScreenState();
}

class _TimeDisplayScreenState extends State<TimeDisplayScreen> {
  /// List of available formatting strategies
  final List<TimeFormatStrategy> _strategies = [
    TwelveHourFormat(),
    TwentyFourHourFormat(),
  ];

  /// Labels for each strategy (for the UI)
  final List<String> _labels = [
    '12-hour (AM/PM)',
    '24-hour',
  ];

  /// Currently selected strategy index
  int _selected = 0;

  /// Example time to display
  final DateTime _exampleTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Format Strategy Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔹 The widget that uses the current selected strategy
            FormattedTime(
              time: _exampleTime,
              formatStrategy: _strategies[_selected],
            ),

            const SizedBox(height: 24),

            /// 🔹 UI to let the user pick the formatting strategy
            Text(
              'Choose time format:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ..._labels.asMap().entries.map((entry) {
              return RadioListTile<int>(
                title: Text(entry.value),
                value: entry.key,
                groupValue: _selected,
                onChanged: (val) => setState(() => _selected = val!),
              );
            }),
            const PatternDefinitionCard(
              title: 'Strategy Pattern',
              description:
                  'Defines a family of algorithms, encapsulates each one, and makes them interchangeable at runtime.',
              exampleContext:
                  'Users dynamically switch between 12-hour and 24-hour time formatting at runtime without changing the display widget code.',
            ),
          ],
        ),
      ),
    );
  }
}
