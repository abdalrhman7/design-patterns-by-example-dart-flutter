import 'package:design_patterns_flutter/behavioral/command/core_examples/remote_example/without_pattern/remote_without_command.dart';

// === Usage Without Command Pattern ===
void main() {
  final remote = RemoteControl();

  remote.setAction('on');
  remote.pressButton(); // Output: Lamp is ON

  remote.setAction('off');
  remote.pressButton(); // Output: Lamp is OFF

  // What if we add "dim" or reuse the same action from a menu, macro, or test?
  // We keep growing the if/else chain and coupling here.
}
