import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/time_format_strategy/time_format_strategy.dart';
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
    RelativeTimeFormat(),
  ];

  /// Labels for each strategy (for the UI)
  final List<String> _labels = [
    '12-hour (AM/PM)',
    '24-hour',
    'Relative time',
  ];

  /// Currently selected strategy index
  int _selected = 0;

  /// Example time to display (1.5 hours ago)
  final DateTime _exampleTime = DateTime.now().subtract(const Duration(minutes: 90));

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

            const Spacer(),

            /// 🔹 Summary of Design Principles used
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Design Principles:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('• Strategy Pattern: encapsulates algorithms (formats)'),
                Text('• Open/Closed Principle: add new formats without changing UI'),
                Text('• Composition over Inheritance: pass strategies dynamically'),
                Text('• Polymorphism: strategy.format(...) chooses correct logic'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
