import 'package:design_patterns_flutter/structural/decorator/flutter_examples/pizza_decorator/ui/decorator_pizza_screen.dart';
import 'package:flutter/material.dart';
import 'package:design_patterns_flutter/behavioral/command/flutter_examples/counter_undo/ui/counter_undo_screen.dart';
import 'package:design_patterns_flutter/behavioral/command/flutter_examples/universal_remote/ui/universal_remote_screen.dart';
import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/time_format_strategy/ui/time_display_screen.dart';
import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/text_style_strategy/ui/text_styling_screen.dart';
import 'package:design_patterns_flutter/creational/singletone/flutter_examples/ui/counter_singletone_screens.dart';

import 'behavioral/observer/flutter_examples/weather_observer/ui/weather_observer_screen.dart';
import 'creational/abstract_factory/flutter_examples/platform_factory/ui/platform_screen.dart';
import 'creational/factory_method/flutter_examples/ui/dialog_factory_screen.dart';

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
            'How objects talk to each other and share work—who does what, and in what order.',
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
                name: 'Command Pattern',
                description: 'Encapsulate requests as objects; queue, log, or undo them.',
                examples: [
                  _ExampleItem(
                    title: 'Example 1: Counter & Undo',
                    subtitle: 'Run +1 / -1 as commands and undo the last step.',
                    screen: const CounterUndoScreen(),
                  ),
                  _ExampleItem(
                    title: 'Example 2: Universal Remote',
                    subtitle: 'TV, fan, lights — many commands, one invoker + movie macro.',
                    screen: const UniversalRemoteScreen(),
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
            'Ways to create objects without being tied to a specific constructor or concrete class',
            [
              _PatternItem(
                name: 'Factory Method',
                description: 'Instantiate objects without specifying concrete class.',
                examples: [
                  _ExampleItem(
                    title: 'Example 1: Dialog Factory',
                    subtitle: 'Cross-platform UI components.',
                    screen: const DialogFactoryScreen(),
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
              _PatternItem(
                name: 'Abstract Factory',
                description: 'Create families of related objects without specifying concrete classes.',
                examples: [
                  _ExampleItem(
                    title: 'Example 1: Platform UI Widgets',
                    subtitle: 'Material vs Cupertino widget families.',
                    screen: const PlatformScreen(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildCategorySection(
            context,
            'Structural Patterns',
            'Ways to combine classes or objects into larger structures—wrapping, adapting, or composing them cleanly',
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

  Widget _buildCategorySection(
    BuildContext context,
    String categoryName,
    String categoryInfo,
    List<_PatternItem> patterns,
  ) {
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
                  categoryName.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.indigo),
                tooltip: 'What is $categoryName?',
                onPressed: () => _showCategoryInfoDialog(context, categoryName, categoryInfo),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
              ),
            ],
          ),
        ),
        ...patterns.map((pattern) => _buildPatternExpansion(context, pattern)),
      ],
    );
  }

  void _showCategoryInfoDialog(BuildContext context, String title, String body) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(body, style: const TextStyle(height: 1.4)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
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
