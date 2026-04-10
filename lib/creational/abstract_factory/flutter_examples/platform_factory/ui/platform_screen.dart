import 'package:design_patterns_flutter/creational/abstract_factory/flutter_examples/platform_factory/platform_factory.dart';
import 'package:flutter/material.dart';

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
  double _sliderValue = 0.5;
  String _selectedOption = 'A';
  final List<String> _options = ['A', 'B', 'C'];

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
    final button = _currentFactory.createButton(
      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Button Pressed!')),
      ),
      text: 'Platform Button',
    );

    final checkbox = _currentFactory.createCheckbox(
      value: _checkboxValue,
      onChanged: (val) => setState(() => _checkboxValue = val!),
    );

    final indicator = _currentFactory.createIndicator();

    final slider = _currentFactory.createSlider(
      value: _sliderValue,
      onChanged: (val) => setState(() => _sliderValue = val),
    );


    return Scaffold(
      appBar: AppBar(
        title: const Text('Abstract Factory: Platform Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Currently using: ${_isMaterial ? "Material (Android)" : "Cupertino (iOS)"}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Material'),
                Switch(value: _isMaterial, onChanged: _toggleFactory),
                const Text('Cupertino'),
              ],
            ),
            const Divider(height: 40),
            
            _buildSection('Button', button),
            _buildSection('Indicator', indicator),
            _buildSection(
              'Checkbox / Switch', 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Interaction: '),
                  checkbox,
                ],
              ),
            ),
            _buildSection('Slider', slider),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, Widget child) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        child,
        const SizedBox(height: 30),
      ],
    );
  }
}
