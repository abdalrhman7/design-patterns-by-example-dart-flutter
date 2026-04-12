
import 'package:design_patterns_flutter/home_screen/widgets/pattern_category_section.dart';
import 'package:flutter/material.dart';

import 'home_pattern_catalog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final _categories = buildHomePatternCatalog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design Patterns Explorer'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          for (var i = 0; i < _categories.length; i++) ...[
            PatternCategorySection(category: _categories[i]),
            if (i < _categories.length - 1) const SizedBox(height: 20),
          ],
        ],
      ),
    );
  }
}
