import 'package:design_patterns_flutter/creational/abstract_factory/flutter_examples/platform_factory/platform_factory.dart';
import 'package:flutter/material.dart';

// User request: Renamed from WidgetsScreen / PlatformScreen
class PlatformScreen extends StatefulWidget {
  const PlatformScreen({super.key});

  @override
  State<PlatformScreen> createState() => _PlatformScreenState();
}

class _PlatformScreenState extends State<PlatformScreen> {
  // Current factory being used
  late UIWidgetsFactory _currentFactory;
  bool _isMaterial = true;
  bool _checkboxValue = false;

  @override
  void initState() {
    super.initState();
    // Default to Material Factory
    _currentFactory = MaterialWidgetsFactory();
  }

  void _toggleFactory(bool value) {
    setState(() {
      _isMaterial = value;
      // 🔹 Switching between factories at runtime!
      _currentFactory = value ? MaterialWidgetsFactory() : CupertinoWidgetsFactory();
    });
  }

  @override
  Widget build(BuildContext context) {
    // 🔹 Polymorphism in action:
    // We create products through an abstract factory, then use abstract products.
    final button = _currentFactory.createButton();
    final checkbox = _currentFactory.createCheckbox();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Abstract Factory: Platform Widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Currently using: ${_isMaterial ? "Material (Android)" : "Cupertino (iOS)"}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Material'),
                Switch(value: _isMaterial, onChanged: _toggleFactory),
                const Text('Cupertino'),
              ],
            ),
            const Divider(height: 50),
            // 🔹 These widgets are created by the currently injected factory!
            button.build(
              context,
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Button Pressed!')),
              ),
              text: 'Platform Button',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Platform Checkbox: '),
                checkbox.build(
                  context,
                  value: _checkboxValue,
                  onChanged: (val) => setState(() => _checkboxValue = val!),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
