import 'package:design_patterns_flutter/home_screen/pattern_models.dart';
import 'package:design_patterns_flutter/home_screen/widgets/pattern_expansion_card.dart';
import 'package:flutter/material.dart';

import 'category_info_dialog.dart';

class PatternCategorySection extends StatelessWidget {
  const PatternCategorySection({super.key, required this.category});

  final PatternCategory category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, right: 2, bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  category.name.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.indigo),
                tooltip: 'What is ${category.name}?',
                onPressed: () => showCategoryInfoDialog(context, category.name, category.info),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
              ),
            ],
          ),
        ),
        ...category.patterns.map((p) => PatternExpansionCard(pattern: p)),
      ],
    );
  }
}
