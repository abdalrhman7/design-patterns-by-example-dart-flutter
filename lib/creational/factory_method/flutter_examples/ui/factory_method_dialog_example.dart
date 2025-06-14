import 'package:design_patterns_flutter/creational/factory_method/flutter_examples/dialog_factory_method.dart';
import 'package:flutter/material.dart';

// —— Client Code — FactoryMethodDialogExample ——

// UI lets the user pick a dialog type (Android/iOS), and shows it using selected DialogManager.
// 🔹 Uses only abstract DialogManager and CustomDialog types — fully decoupled from concrete implementations.

class FactoryMethodDialogExample extends StatefulWidget {
  const FactoryMethodDialogExample({super.key});

  @override
  State<FactoryMethodDialogExample> createState() =>
      _FactoryMethodDialogExampleState();
}

class _FactoryMethodDialogExampleState
    extends State<FactoryMethodDialogExample> {
  int _selectedPlatform = 0;
  String _selectedDialogType = 'alert';

  final List<DialogManager> _dialogManagers = [
    AndroidDialogManager(),
    IosDialogManager(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentManager = _dialogManagers[_selectedPlatform];

    return Scaffold(
      appBar: AppBar(title: const Text("Factory Method Dialog Example")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<int>(
              value: _selectedPlatform,
              items: const [
                DropdownMenuItem(value: 0, child: Text("Android")),
                DropdownMenuItem(value: 1, child: Text("iOS")),
              ],
              onChanged: (index) {
                if (index != null) {
                  setState(() {
                    _selectedPlatform = index;
                  });
                }
              },
            ),
            DropdownButton<String>(
              value: _selectedDialogType,
              items: const [
                DropdownMenuItem(value: 'alert', child: Text("Alert Dialog")),
                DropdownMenuItem(
                    value: 'confirm', child: Text("Confirm Dialog")),
              ],
              onChanged: (type) {
                if (type != null) {
                  setState(() {
                    _selectedDialogType = type;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  currentManager.showDialog(context, _selectedDialogType),
              child: const Text("Show Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}
