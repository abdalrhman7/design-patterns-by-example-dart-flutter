import 'package:flutter/material.dart';
import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/time_format_strategy/ui/time_display_screen.dart';
import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/text_style_strategy/ui/text_styling_screen.dart';
import 'package:design_patterns_flutter/creational/factory_method/flutter_examples/ui/factory_method_dialog_example.dart';
import 'package:design_patterns_flutter/creational/singletone/flutter_examples/ui/counter_singletone_screens.dart';
import 'package:design_patterns_flutter/structural/decorator/flutter_examples/ui/decorator_pizza_screen.dart';

import 'behavioral/observer/flutter_examples/weather_observer/ui/weather_observer_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          _buildCategorySection(
            context,
            'Behavioral Patterns',
            [
              _PatternItem(
                name: 'Strategy Pattern',
                description: 'Switch between different behaviors or algorithms.',
                examples: [
                  _ExampleItem(
                    title: 'Example 1: Time Formatter',
                    subtitle: 'Dynamic date/time formatting options.',
                    screen: const TimeDisplayScreen(),
                  ),
                  _ExampleItem(
                    title: 'Example 2: Text Styling',
                    subtitle: 'Change text appearance (Bold, Italic, color).',
                    screen: const TextStylingScreen(),
                  ),
                ],
              ),
              _PatternItem(
                name: 'Observer Pattern',
                description: 'One-to-many dependency notification.',
                examples: [
                  _ExampleItem(
                    title: 'Example 1: Weather Station',
                    subtitle: 'Notifications for temp & humidity changes.',
                    screen: const WeatherObserverScreen(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildCategorySection(
            context,
            'Creational Patterns',
            [
              _PatternItem(
                name: 'Factory Method',
                description: 'Instantiate objects without specifying concrete class.',
                examples: [
                  _ExampleItem(
                    title: 'Example 1: Dialog Factory',
                    subtitle: 'Cross-platform UI components.',
                    screen: const FactoryMethodDialogExample(),
                  ),
                ],
              ),
              _PatternItem(
                name: 'Singleton Pattern',
                description: 'Ensure a class has only one instance.',
                examples: [
                  _ExampleItem(
                    title: 'Example 1: App State Counter',
                    subtitle: 'Shared instance between different screens.',
                    screen: const CounterFirstScreen(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildCategorySection(
            context,
            'Structural Patterns',
            [
              _PatternItem(
                name: 'Decorator Pattern',
                description: 'Add behavior to objects dynamically.',
                examples: [
                  _ExampleItem(
                    title: 'Example 1: Pizza Ordering',
                    subtitle: 'Layering toppings at runtime.',
                    screen: const DecoratorPizzaScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, String categoryName, List<_PatternItem> patterns) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            categoryName.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, letterSpacing: 1.2),
          ),
        ),
        ...patterns.map((pattern) => _buildPatternExpansion(context, pattern)).toList(),
      ],
    );
  }

  Widget _buildPatternExpansion(BuildContext context, _PatternItem pattern) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(pattern.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(pattern.description, style: const TextStyle(fontSize: 13)),
        leading: const Icon(Icons.architecture, color: Colors.indigo),
        childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
        children: pattern.examples.map((example) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            title: Text(example.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            subtitle: Text(example.subtitle, style: const TextStyle(fontSize: 12)),
            trailing: const Icon(Icons.play_circle_fill, color: Colors.indigo, size: 28),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => example.screen));
            },
          );
        }).toList(),
      ),
    );
  }
}

// Helper models for organization
class _PatternItem {
  final String name;
  final String description;
  final List<_ExampleItem> examples;
  _PatternItem({required this.name, required this.description, required this.examples});
}

class _ExampleItem {
  final String title;
  final String subtitle;
  final Widget screen;
  _ExampleItem({required this.title, required this.subtitle, required this.screen});
}
