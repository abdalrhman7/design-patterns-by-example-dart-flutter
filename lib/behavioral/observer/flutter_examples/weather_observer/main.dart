import 'package:design_patterns_flutter/behavioral/observer/flutter_examples/weather_observer/ui/weather_observer_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp(),);
}


class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Observer Pattern: Weather',
      home: const WeatherObserverScreen(),
    );
  }
}