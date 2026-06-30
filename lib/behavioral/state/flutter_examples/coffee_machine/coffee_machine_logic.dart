import 'package:flutter/foundation.dart';

/// -------------------------------------------------------------
/// STATE PATTERN (FLUTTER LOGIC)
/// -------------------------------------------------------------
/// Notice how the State classes ONLY contain behavior (methods).
/// They do not contain any UI getters. When a behavior is triggered,
/// the active State manipulates the Context's data (displayMessage)
/// and explicitly triggers transitions.
///
/// This perfectly demonstrates the State Pattern solving the "if/else"
/// problem while remaining a pure backend behavioral pattern.

// --- 1. The Context ---
class CoffeeMachine extends ChangeNotifier {
  late MachineState _state;

  // Context Data that the states will manipulate
  String _displayMessage = "Initializing...";
  int _coffeeInventory = 3;

  CoffeeMachine() {
    // Initial State is Idle
    _state = IdleState(this);
    // Silent update to avoid premature notifyListeners during construction
    _displayMessage = "Machine Ready. Please insert a coin.";
  }

  // --- Context API for the UI ---
  String get displayMessage => _displayMessage;
  int get inventory => _coffeeInventory;
  MachineState get currentState => _state;

  // --- Context Methods for the States to manipulate data ---

  // Grouping state and message updates into a single method
  // drastically reduces unnecessary UI rebuilds (notifyListeners).
  void updateStateAndMessage(MachineState newState, String message) {
    _state = newState;
    _displayMessage = message;
    notifyListeners();
  }

  // Single method to update just the message safely
  void updateMessage(String message) {
    _displayMessage = message;
    notifyListeners();
  }

  // Pure logic, does not notify directly. It relies on the subsequent
  // state/message update to trigger the UI rebuild cleanly.
  void decreaseInventory() {
    if (_coffeeInventory > 0) {
      _coffeeInventory--;
    }
  }

  // --- Delegated Behaviors (UI calls these) ---
  void insertCoin() => _state.insertCoin();
  void selectCoffee() => _state.selectCoffee();
  void takeCoffee() => _state.takeCoffee();
}

// --- 2. The Abstract State ---
abstract class MachineState {
  final CoffeeMachine machine;
  MachineState(this.machine);

  // All behaviors that change depending on what state the machine is in.
  // There are absolutely NO massive if-else statements here.
  void insertCoin();
  void selectCoffee();
  void takeCoffee();
}

// --- 3. Concrete States ---

class IdleState extends MachineState {
  IdleState(super.machine);

  @override
  void insertCoin() {
    machine.updateStateAndMessage(
        HasCoinState(machine), "Coin inserted. Select your coffee.");
  }

  @override
  void selectCoffee() {
    machine.updateMessage("Error: You must insert a coin first!");
  }

  @override
  void takeCoffee() {
    machine.updateMessage("Error: No coffee has been brewed.");
  }
}

class HasCoinState extends MachineState {
  HasCoinState(super.machine);

  @override
  void insertCoin() {
    machine.updateMessage("Error: A coin is already inserted.");
  }

  @override
  void selectCoffee() {
    // 1. Safe Inventory Guard
    if (machine.inventory <= 0) {
      // Reject brewing gracefully and return the coin
      machine.updateStateAndMessage(
          OutOfStockState(machine), "Machine is out of stock. Coin returned.");
      return;
    }

    // 2. State Progression
    machine.decreaseInventory();
    final brewingState = BrewingState(machine);

    machine.updateStateAndMessage(
        brewingState, "Brewing your perfect coffee... ⏳");

    // 3. Safe Async Brewing Simulation
    Future.delayed(const Duration(seconds: 2), () {
      // By comparing against the exact 'brewingState' instance created above,
      // we guarantee this callback only fires if the state hasn't been interrupted.
      if (machine.currentState == brewingState) {
        machine.updateStateAndMessage(
            ReadyState(machine), "Ding! Your coffee is ready. Please take it.");
      }
    });
  }

  @override
  void takeCoffee() {
    machine.updateMessage("Error: Please select a coffee to brew first.");
  }
}

class BrewingState extends MachineState {
  BrewingState(super.machine);

  @override
  void insertCoin() {
    machine.updateMessage("Please wait, brewing in progress!");
  }

  @override
  void selectCoffee() {
    machine.updateMessage("Already brewing!");
  }

  @override
  void takeCoffee() {
    machine.updateMessage("Careful! It's too hot. Wait until it's done.");
  }
}

class ReadyState extends MachineState {
  ReadyState(super.machine);

  @override
  void insertCoin() {
    machine.updateMessage("Please take your current coffee first.");
  }

  @override
  void selectCoffee() {
    machine.updateMessage("Please take your current coffee first.");
  }

  @override
  void takeCoffee() {
    if (machine.inventory > 0) {
      machine.updateStateAndMessage(
          IdleState(machine), "Coffee taken. Enjoy! Insert another coin.");
    } else {
      machine.updateStateAndMessage(
          OutOfStockState(machine), "Coffee taken. MACHINE OUT OF STOCK.");
    }
  }
}

class OutOfStockState extends MachineState {
  OutOfStockState(super.machine);

  @override
  void insertCoin() {
    machine.updateMessage("Machine is out of stock. Coin rejected.");
  }

  @override
  void selectCoffee() {
    machine.updateMessage("Out of stock.");
  }

  @override
  void takeCoffee() {
    machine.updateMessage("There is no coffee here.");
  }
}
