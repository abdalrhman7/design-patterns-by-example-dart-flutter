

import 'package:design_patterns_flutter/behavioral/observer/core_examples/with_observer/state_change_observer.dart';

void main() {
  final observable = Observable();

  final logger = LoggingObserver();
  final display = DisplayObserver();
  final alert = AlertObserver();

  // Register observers
  observable.addObserver(logger);
  observable.addObserver(display);

  // First notification
  observable.notifyObservers("State A");

  // Dynamically add another observer
  observable.addObserver(alert);

  // Second notification
  observable.notifyObservers("State B");

  // You could also remove observers at any time:
  observable.removeObserver(display);

  // Third notification
  observable.notifyObservers("State C");
}
