import 'package:flutter/material.dart';

// Import the main screens for each pattern demo
import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/time_format_strategy/ui/time_display_screen.dart';
import 'package:design_patterns_flutter/behavioral/observer/flutter_examples/ui/weather_observer_screen.dart';
import 'package:design_patterns_flutter/creational/factory_method/flutter_examples/ui/factory_method_dialog_example.dart';
import 'package:design_patterns_flutter/creational/singletone/flutter_examples/ui/counter_singletone_screens.dart'; // Correcting the path if it's there
import 'package:design_patterns_flutter/structural/decorator/flutter_examples/ui/decorator_pizza_screen.dart';

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
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCategoryHeader('Behavioral Patterns'),
          _buildPatternCard(
            context,
            'Strategy Pattern',
            'Time Format Switcher Example',
            const TimeDisplayScreen(),
          ),
          _buildPatternCard(
            context,
            'Observer Pattern',
            'Weather Station Example',
            const WeatherObserverScreen(),
          ),
          const Divider(height: 32),
          _buildCategoryHeader('Creational Patterns'),
          _buildPatternCard(
            context,
            'Factory Method',
            'Cross-Platform Dialog Example',
            const FactoryMethodDialogExample(),
          ),
          _buildPatternCard(
            context,
            'Singleton Pattern',
            'Shared Counter State Example',
            const CounterFirstScreen(), // Using the first screen of the singleton example
          ),
          const Divider(height: 32),
          _buildCategoryHeader('Structural Patterns'),
          _buildPatternCard(
            context,
            'Decorator Pattern',
            'Pizza Toppings Order Example',
            const DecoratorPizzaScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }

  Widget _buildPatternCard(
    BuildContext context,
    String title,
    String subtitle,
    Widget targetScreen,
  ) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          );
        },
      ),
    );
  }
}
