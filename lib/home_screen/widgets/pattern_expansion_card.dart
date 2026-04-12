import 'package:flutter/material.dart';

import '../pattern_models.dart';

class PatternExpansionCard extends StatelessWidget {
  const PatternExpansionCard({super.key, required this.pattern});

  final PatternItem pattern;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(pattern.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(pattern.description, style: const TextStyle(fontSize: 13)),
        childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
        children: [
          for (final example in pattern.examples)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              title: Text(
                example.title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(example.subtitle, style: const TextStyle(fontSize: 12)),
              trailing: const Icon(Icons.play_circle_fill, color: Colors.indigo, size: 28),
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(builder: (_) => example.screen),
                );
              },
            ),
        ],
      ),
    );
  }
}
