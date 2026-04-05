import 'package:design_patterns_flutter/creational/abstract_factory/flutter_examples/ui_widgets_factory/platform_factory.dart';
import 'package:flutter/material.dart';

class WidgetsScreen extends StatefulWidget {
  const WidgetsScreen({super.key});

  @override
  State<WidgetsScreen> createState() => _WidgetsScreenState();
}

class _WidgetsScreenState extends State<WidgetsScreen> {
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
      // The rest of the code doesn't care about which factory it's using
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
        title: const Text('Abstract Factory: UI Widgets'),
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
            // The UI code is decoupled from concrete widget implementations.
            button.build(
              context,
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Button Pressed!')),
              ),
              text: 'Themed Button',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Checkbox/Switch: '),
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
