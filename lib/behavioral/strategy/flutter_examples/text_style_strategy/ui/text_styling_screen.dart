import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/text_style_strategy/text_style_strategy.dart';
import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/text_style_strategy/ui/styled_text.dart';
import 'package:flutter/material.dart';


class TextStylingScreen extends StatefulWidget {
  const TextStylingScreen({super.key});

  @override
  State<TextStylingScreen> createState() => _TextStylingScreenState();
}

class _TextStylingScreenState extends State<TextStylingScreen> {
  // List of strategies to choose from
  final List<TextStyleStrategy> _strategies = [
    BoldTextStyle(),
    ItalicTextStyle(),
    AccentColorTextStyle(),
  ];

  // Human-readable labels for UI
  final List<String> _labels = [
    'Bold',
    'Italic',
    'Blue Accent',
  ];

  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Styling Strategy Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Show the styled text with the current strategy
            StyledText(
              text: 'Hello, Strategy!',
              textStyleStrategy: _strategies[_selected],
            ),
            const SizedBox(height: 24),

            // Let user pick which styling strategy to apply
            Text('Choose a style:', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            ..._labels.asMap().entries.map((entry) {
              final idx = entry.key;
              final label = entry.value;
              return RadioListTile<int>(
                title: Text(label),
                value: idx,
                groupValue: _selected,
                onChanged: (v) {
                  setState(() => _selected = v!);
                },
              );
            }),

            const Spacer(),

            // Summary of current principles in action
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Key Design Principles:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('• Code to an interface, not an implementation'),
                Text('• Encapsulate what varies'),
                Text('• Favor composition over inheritance'),
                Text('• Polymorphism in action'),
                Text('• Open/Closed: add new styles without modifying existing code'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}