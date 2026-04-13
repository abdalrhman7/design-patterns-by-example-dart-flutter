import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';
import 'package:design_patterns_flutter/structural/adapter/flutter_examples/charger_adapter/charger_adapter.dart';
import 'package:flutter/material.dart';

class ChargerAdapterScreen extends StatefulWidget {
  const ChargerAdapterScreen({super.key});

  @override
  State<ChargerAdapterScreen> createState() => _ChargerAdapterScreenState();
}

class _ChargerAdapterScreenState extends State<ChargerAdapterScreen> {
  final ModernPhone _phone = ModernPhone();
  final OldUsbACharger _oldCharger = OldUsbACharger();

  String _status = 'Try charging with and without an adapter.';

  void _tryWithoutAdapter() {
    setState(() {
      _status =
          'Fail: Phone expects USB-C port, but charger exposes USB-A only. '
          'Interfaces are incompatible.';
    });
  }

  void _chargeWithAdapter() {
    final adapter = UsbAToUsbCAdapter(_oldCharger);
    setState(() {
      _status = _phone.charge(adapter);
    });
  }

  @override
  Widget build(BuildContext context) {
    final battery = _phone.batteryPercent;
    final isHealthy = battery >= 50;

    return Scaffold(
      appBar: AppBar(title: const Text('Adapter Pattern: Charger Ports')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: Icon(
                isHealthy ? Icons.battery_charging_full : Icons.battery_alert,
                color: isHealthy ? Colors.green : Colors.orange,
                size: 32,
              ),
              title: const Text('Phone Battery'),
              subtitle: Text('$battery%'),
            ),
          ),
          const SizedBox(height: 8),
          const Card(
            child: ListTile(
              leading: Icon(Icons.power),
              title: Text('Available Charger'),
              subtitle: Text('Old charger exposes USB-A only'),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _tryWithoutAdapter,
            icon: const Icon(Icons.close),
            label: const Text('Charge without Adapter'),
          ),
          const SizedBox(height: 8),
          FilledButton.tonalIcon(
            onPressed: _chargeWithAdapter,
            icon: const Icon(Icons.cable),
            label: const Text('Charge using USB-A -> USB-C Adapter'),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              title: const Text('Result'),
              subtitle: Text(_status),
            ),
          ),
          const PatternDefinitionCard(
            title: 'Adapter Pattern',
            description:
                'Makes incompatible interfaces work together by translating one contract into another.',
            exampleContext:
                'The phone expects UsbCPort. OldUsbACharger does not match, so UsbAToUsbCAdapter translates calls and delegates to the old charger.',
          ),
        ],
      ),
    );
  }
}
