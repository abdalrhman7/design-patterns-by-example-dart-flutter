import 'package:design_patterns_flutter/creational/singletone/flutter_examples/counter_singletone.dart';
import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';
import 'package:flutter/material.dart';

/// === HomePage ===
/// 🏠 First screen: shows both counters and buttons to increment and navigate.
class CounterFirstScreen extends StatefulWidget {
  const CounterFirstScreen({super.key});

  @override
  State<CounterFirstScreen> createState() => _CounterFirstScreenState();
}

class _CounterFirstScreenState extends State<CounterFirstScreen> {
  // Shared singleton counter
  final SingletonCounter singletonCounter = SingletonCounter();

  // New non-singleton instance for this screen
  final NonSingletonCounter nonSingletonCounter = NonSingletonCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Singleton Counter: ${singletonCounter.count}'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  singletonCounter.increment();
                });
              },
              child: const Text('Increment Singleton'),
            ),
            const SizedBox(height: 20),
            Text('Non-Singleton Counter: ${nonSingletonCounter.count}'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nonSingletonCounter.increment();
                });
              },
              child: const Text('Increment Non-Singleton'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                // Navigate to second screen
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CounterSecondScreen()),
                );
                setState(() {});
              },
              child: const Text('Go to Second Page'),
            ),
            const PatternDefinitionCard(
              title: 'Singleton Pattern',
              description:
                  'Ensures a class has only one instance and provides a global access point to it.',
              exampleContext:
                  'SingletonCounter preserves shared state across both screens, while NonSingletonCounter does not.',
            ),
          ],
        ),
      ),
    );
  }
}

/// === SecondPage ===
/// 📝 Second screen: shows counters again to highlight singleton persistence.
class CounterSecondScreen extends StatefulWidget {
  const CounterSecondScreen({super.key});

  @override
  State<CounterSecondScreen> createState() => _CounterSecondScreenState();
}

class _CounterSecondScreenState extends State<CounterSecondScreen> {
  // Obtain singleton and a new non-singleton instance
  final SingletonCounter singletonCounter = SingletonCounter();
  final NonSingletonCounter nonSingletonCounter = NonSingletonCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SingletonCounter retains its previous value
            Text('Singleton Counter: ${singletonCounter.count}'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  singletonCounter.increment();
                });
              },
              child: const Text('Increment Singleton'),
            ),
            const SizedBox(height: 20),
            // NonSingletonCounter is a fresh instance, resets to zero
            Text('Non-Singleton Counter: ${nonSingletonCounter.count}'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nonSingletonCounter.increment();
                });
              },
              child: const Text('Increment Non-Singleton'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Home'),
            ),
            const PatternDefinitionCard(
              title: 'Singleton Pattern',
              description:
                  'Provides one shared instance so data can stay consistent across different parts of the app.',
              exampleContext:
                  'This screen reads the same SingletonCounter instance to show persistence after navigation.',
            ),
          ],
        ),
      ),
    );
  }
}