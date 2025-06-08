// Observable: manages a list of observers and notifies them of state changes.
// 🔹 Loose coupling: Observable only depends on the Observer interface, not concrete implementations.
// 🔹 Separation of Concerns:
// Each part has its own responsibility.
// The Observable (subject) just notifies — it doesn't care what observers do.
// Observers decide how to react, and neither depends on the internal logic of the other.
// Changes in one won't break the other (Loose Coupling in action).
// 🔹 This makes the system more maintainable and extensible:
// You can add/remove observers or change how they react without touching the Observable,
// and vice versa.
class Observable {
  final List<Observer> _observers = [];

  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  void notifyObservers(String state) {
    // 🔹 Polymorphism in action: each observer’s own update() runs at runtime.
    for (final observer in _observers) {
      observer.update(state);
    }
  }
}

// Observer Interface: defines the method all observers must implement.
// 🔹 Code to an interface, not an implementation: high-level modules depend on this abstraction.
// 🔹 Open/Closed Principle (SOLID): you can add new observers without changing Observable.
abstract class Observer {
  void update(String state);
}

// Concrete Observer 1: logs updates to the console.
class LoggingObserver implements Observer {
  @override
  void update(String state) {
    print('[Logger] New state: $state');
  }
}

// Concrete Observer 2: displays updates in a simple UI simulation.
class DisplayObserver implements Observer {
  @override
  void update(String state) {
    print('[Display] Showing new state: $state');
  }
}

// Concrete Observer 3: triggers an alert action.
class AlertObserver implements Observer {
  @override
  void update(String state) {
    print('[Alert] 🚨 Alert triggered for state: $state');
  }
}

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
