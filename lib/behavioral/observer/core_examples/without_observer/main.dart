import 'package:design_patterns_flutter/behavioral/observer/core_examples/without_observer/state_change_without_observer.dart';

// === Usage Without Observer Pattern ===
void main() {
  final controller = AppController();

  // 🔄 Changing state manually triggers all listeners
  controller.changeState("State A");
  controller.changeState("State B");

  // ❌ What if we want to disable one of the reactions (e.g., stop alert)?
  // We’d have to modify AppController, which breaks OCP
}
