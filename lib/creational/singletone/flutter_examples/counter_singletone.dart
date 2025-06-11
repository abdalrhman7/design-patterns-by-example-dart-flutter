// Flutter UI Example: Demonstrating Singleton vs Non-Singleton

import 'package:flutter/material.dart';

/// === SingletonCounter ===
/// 🔒 Ensures a single shared instance across the app.
class SingletonCounter {
  // Private static instance
  static final SingletonCounter _instance = SingletonCounter._internal();

  // Internal counter state
  int _count = 0;

  // Private constructor
  SingletonCounter._internal();

  // Factory returns the same instance every time
  factory SingletonCounter() => _instance;

  // Increment method
  void increment() {
    _count++;
  }

  // Getter for count
  int get count => _count;
}

/// === NonSingletonCounter ===
/// ❌ Creates a new instance each time.
class NonSingletonCounter {
  int _count = 0;

  void increment() {
    _count++;
  }

  int get count => _count;
}


