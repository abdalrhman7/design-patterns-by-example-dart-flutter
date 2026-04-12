/// Command that can be reversed (typical for text editors, counters, etc.).
// 🔹 Code to an interface — the invoker only calls execute/undo on this type.
abstract class UndoableCommand {
  void execute();
  void undo();
}

/// Receiver: holds the real state the user sees.
// 🔹 Separation of concerns: domain/state lives here, not in widgets or invoker.
class CounterReceiver {
  int _value = 0;

  int get value => _value;

  void applyDelta(int delta) {
    _value += delta;
  }
}

/// Concrete command: add one to the counter.
class AddOneCommand implements UndoableCommand {
  final CounterReceiver _receiver;

  AddOneCommand(this._receiver);

  @override
  void execute() {
    _receiver.applyDelta(1);
  }

  @override
  void undo() {
    _receiver.applyDelta(-1);
  }
}

/// Concrete command: subtract one from the counter.
class SubtractOneCommand implements UndoableCommand {
  final CounterReceiver _receiver;

  SubtractOneCommand(this._receiver);

  @override
  void execute() {
    _receiver.applyDelta(-1);
  }

  @override
  void undo() {
    _receiver.applyDelta(1);
  }
}

/// Invoker: runs commands and keeps an undo stack.
// 🔹 The UI (or toolbar, shortcuts) only talks to this — not to [CounterReceiver] directly.
// 🔹 Favor composition: plug in any [UndoableCommand] at runtime.
class CommandInvoker {
  final List<UndoableCommand> _history = [];

  bool get canUndo => _history.isNotEmpty;

  void execute(UndoableCommand command) {
    command.execute();
    _history.add(command);
  }

  void undo() {
    if (!canUndo) return;
    _history.removeLast().undo();
  }
}
