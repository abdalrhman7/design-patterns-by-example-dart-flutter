/// Receiver: knows how to perform the real work.
class Lamp {
  void turnOn() {
    print('Lamp is ON');
  }

  void turnOff() {
    print('Lamp is OFF');
  }
}

/// Acts like a remote, but implemented the "wrong" way
/// it decides *what* to do using strings and branches, and it calls
/// the [Lamp] directly.
class RemoteControl {
  final Lamp _lamp = Lamp();
  String _action = 'on';

  void setAction(String action) {
    _action = action;
  }

  void pressButton() {
    // Problem 1: Long conditional logic to choose behavior.
    // This violates the Open/Closed Principle (OCP):
    // every new action (e.g. dim, toggle) requires editing this method.
    if (_action == 'on') {
      _lamp.turnOn();
    } else if (_action == 'off') {
      _lamp.turnOff();
    } else {
      print('Unknown action');
    }

    // Problem 2: Tight coupling between the "invoker" and the receiver.
    // This class must know every method on [Lamp] and every action name.
    // Harder to test, reuse, queue, or log requests as objects.

    // Problem 3: Poor separation of concerns — [RemoteControl] mixes the role of
    // "when to run" (button press) with "what to run" (branching on strings) and
    // "how the lamp works" (calling [Lamp] methods directly) in one place.
  }
}
