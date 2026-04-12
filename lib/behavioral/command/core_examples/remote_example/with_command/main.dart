import 'package:design_patterns_flutter/behavioral/command/core_examples/remote_example/with_command/remote_command.dart';

void main() {
  final lamp = Lamp();
  final remote = RemoteInvoker();

  // Client wires concrete commands to the receiver, then gives them to the invoker.
  remote.setCommand(TurnOnCommand(lamp));
  remote.pressButton(); // Output: Lamp is ON

  remote.setCommand(TurnOffCommand(lamp));
  remote.pressButton(); // Output: Lamp is OFF

  // 🔹 Open for extension:
  // Add DimCommand, ToggleCommand, etc. without editing RemoteInvoker.pressButton().
}
