import 'package:design_patterns_flutter/creational/abstract_factory/flutter_examples/platform_factory/platform_factory.dart';
import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abstract Factory: Platform Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildHeader(),
            const Divider(height: 25),
            
            _buildSection('Button', _buildButton()),
            _buildSection('Indicator', _buildIndicator()),
            _buildSection('Checkbox / Switch', _buildCheckbox()),
            _buildSection('Slider', _buildSlider()),
            const Divider(height: 30),
            const PatternDefinitionCard(
              title: 'Abstract Factory Pattern',
              description:
                  'Provides an interface for creating families of related objects without specifying their concrete classes.',
              exampleContext:
                  'It creates a full widget family (button, indicator, checkbox, slider) as Material or Cupertino at runtime.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
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
      ],
    );
  }

  Widget _buildButton() {
    return _currentFactory.createButton(
      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Button Pressed!')),
      ),
      text: 'Platform Button',
    );
  }

  Widget _buildCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Interaction: '),
        _currentFactory.createCheckbox(
          value: _checkboxValue,
          onChanged: (val) => setState(() => _checkboxValue = val!),
        ),
      ],
    );
  }

  Widget _buildIndicator() => _currentFactory.createIndicator();

  Widget _buildSlider() {
    return _currentFactory.createSlider(
      value: _sliderValue,
      onChanged: (val) => setState(() => _sliderValue = val),
    );
  }


  Widget _buildSection(String title, Widget child) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 12),
        child,
        const SizedBox(height: 8),
      ],
    );
  }
}
