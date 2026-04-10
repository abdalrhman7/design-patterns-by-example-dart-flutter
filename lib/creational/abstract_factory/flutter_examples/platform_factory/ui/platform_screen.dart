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
            _buildPatternDefinition(),
          ],
        ),
      ),
    );
  }

  Widget _buildPatternDefinition() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey.withOpacity(0.2)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blueGrey),
              SizedBox(width: 8),
              Text(
                'Abstract Factory Pattern',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Provides an interface for creating families of related or dependent objects without specifying their concrete classes.',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
          SizedBox(height: 8),
          Text(
            'In this example: It is used to create a suite of widgets (Button, Slider, etc.) that match the specific platform theme (Material or Cupertino) dynamically.',
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.blueGrey,
            ),
          ),
        ],
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
