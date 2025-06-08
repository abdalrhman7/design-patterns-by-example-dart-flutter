import 'dart:math';

import 'package:design_patterns_flutter/behavioral/observer/flutter_examples/weather_observer.dart';
import 'package:flutter/material.dart';

class WeatherObserverScreen extends StatefulWidget {
  const WeatherObserverScreen({super.key});

  @override
  State<WeatherObserverScreen> createState() => _WeatherObserverScreenState();
}

class _WeatherObserverScreenState extends State<WeatherObserverScreen> {
  final WeatherStation _station = WeatherStation();

  late TemperatureDisplay _tempDisplay;
  late HumidityDisplay _humidityDisplay;
  late AlertDisplay _alertDisplay;

  @override
  void initState() {
    super.initState();
    _tempDisplay = TemperatureDisplay();
    _humidityDisplay = HumidityDisplay();
    _alertDisplay = AlertDisplay();

    _station.addObserver(_tempDisplay);
    _station.addObserver(_humidityDisplay);
    _station.addObserver(_alertDisplay);
  }

  void _updateWeather() {
    final random = Random();
    final temp = 20 + random.nextInt(20);
    final hum = 40 + random.nextInt(30);
    _station.setMeasurements(temp, hum);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🌦️ Observer Pattern - Weather')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _tempDisplay.build(),
            const SizedBox(height: 10),
            _humidityDisplay.build(),
            const SizedBox(height: 10),
            _alertDisplay.build(),
            const Spacer(),
            ElevatedButton(
              onPressed: _updateWeather,
              child: const Text('🔄 Update Weather'),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const Text('Design Principles:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('• One-to-many relationship (Subject → Observers)'),
            const Text('• Loose coupling between WeatherStation and displays'),
            const Text(
                '• Observers react independently (Separation of Concerns)'),
            const Text(
                '• Open/Closed: Add new observers without changing existing code'),
          ],
        ),
      ),
    );
  }
}
