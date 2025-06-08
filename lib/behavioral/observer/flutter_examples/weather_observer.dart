import 'package:flutter/material.dart';

// 🔹 Observable (Subject): manages internal weather state and notifies all registered observers.
// 🔹 Loose Coupling: WeatherStation only depends on the WeatherObserver interface, not concrete observers.
// 🔹 Separation of Concerns:
//     - WeatherStation handles state and notification only.
//     - Observers handle how to respond to changes.
// 🔹 Open/Closed Principle: add/remove observers without modifying the subject itself.
// 🔹 Maintainability: observers and subject can evolve independently.
class WeatherStation {
  final List<WeatherObserver> _observers = [];
  int _temperature = 0;
  int _humidity = 0;

  void addObserver(WeatherObserver observer) => _observers.add(observer);

  void removeObserver(WeatherObserver observer) => _observers.remove(observer);

  // Simulates a new reading from weather sensors.
  void setMeasurements(int temp, int hum) {
    _temperature = temp;
    _humidity = hum;
    _notifyObservers(); // 🔁 Notify all subscribed observers.
  }

  void _notifyObservers() {
    for (final observer in _observers) {
      // ✅ Polymorphism in action: each observer reacts differently to updates.
      observer.update(_temperature, _humidity);
    }
  }
}

// 🔹 Observer Interface: defines the contract that all observers must implement.
// 🔹 Code to an interface, not an implementation: WeatherStation depends only on this abstraction.
// 🔹 Polymorphism: allows different display components to respond differently at runtime.
// 🔹 Open/Closed Principle (SOLID): you can add new observers without modifying existing code.
abstract class WeatherObserver {
  void update(int temperature, int humidity);
}

// Concrete Observer: reacts to temperature changes.
class TemperatureDisplay implements WeatherObserver {
  int _temperature = 0;

  @override
  void update(int temperature, int humidity) {
    _temperature = temperature;
    debugPrint('[TemperatureDisplay] Temp updated: $_temperature °C');
  }

  Widget build() {
    return Text('🌡️ Temp: $_temperature °C');
  }
}

// Concrete Observer: reacts to humidity changes.
class HumidityDisplay implements WeatherObserver {
  int _humidity = 0;

  @override
  void update(int temperature, int humidity) {
    _humidity = humidity;
    debugPrint('[HumidityDisplay] Humidity updated: $_humidity %');
  }

  Widget build() {
    return Text('💧 Humidity: $_humidity %');
  }
}

// Concrete Observer: shows alerts based on temperature threshold.
class AlertDisplay implements WeatherObserver {
  String _alert = '';

  @override
  void update(int temperature, int humidity) {
    if (temperature > 35) {
      _alert = '🔥 Heat Alert! Temp = $temperature °C';
    } else {
      _alert = '';
    }
    debugPrint('[AlertDisplay] $_alert');
  }

  Widget build() {
    return Text(_alert, style: const TextStyle(color: Colors.red));
  }
}
