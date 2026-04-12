// Command interface
// 🔹 Code to an interface, not an implementation
// The invoker depends on this abstraction, not on [Lamp] or concrete actions.
abstract class Command {
  void execute();
}

/// Receiver: actual business logic (the "worker").
class Lamp {
  void turnOn() {
    print('Lamp is ON');
  }

  void turnOff() {
    print('Lamp is OFF');
  }
}

/// Concrete command: encapsulates "turn on" as an object.
// 🔹 Encapsulate what varies — each command is one request you can pass around.
class TurnOnCommand implements Command {
  final Lamp _lamp;

  TurnOnCommand(this._lamp);

  @override
  void execute() {
    _lamp.turnOn();
  }
}

/// Concrete command: encapsulates "turn off" as an object.
class TurnOffCommand implements Command {
  final Lamp _lamp;

  TurnOffCommand(this._lamp);

  @override
  void execute() {
    _lamp.turnOff();
  }
}

/// Invoker: only knows how to run a [Command]; it does not know about [Lamp].
class RemoteInvoker {
  Command? _command;

  // 🔹 Separation of concerns: this class only handles *when* to fire a command.
  // *What* to do lives in concrete commands; *how* the lamp works stays in [Lamp].

  // 🔹 Favor composition over inheritance
  // We plug in a command at runtime instead of hardcoding branches.
  void setCommand(Command command) {
    _command = command;
  }

  void pressButton() {
    // 🔹 Open/Closed (SOLID): new actions = new Command classes,
    // often without changing this method or the invoker's structure.

    // 🔹 Polymorphism: call execute on the abstraction.
    _command?.execute();
  }
}
