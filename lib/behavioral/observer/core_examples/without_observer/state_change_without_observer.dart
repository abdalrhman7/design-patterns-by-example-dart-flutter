// ❌ This version is tightly coupled and not extensible or maintainable.
// ❌ Violates Separation of Concerns: AppController handles multiple responsibilities.
// ❌ Violates Open/Closed: adding/removing new listeners requires changing the core logic.

class AppController {
  String _state = '';

  // ❌ Hardcoded dependencies to all listeners
  void changeState(String newState) {
    _state = newState;

    // ❌ Problem: every listener is hardcoded here
    _logToConsole(_state);
    _updateDisplay(_state);
    _triggerAlert(_state);

    // If we want to add a new listener, we must modify this method
  }

  void _logToConsole(String state) {
    print('[Logger] New state: $state');
  }

  void _updateDisplay(String state) {
    print('[Display] Showing new state: $state');
  }

  void _triggerAlert(String state) {
    print('[Alert] 🚨 Alert triggered for state: $state');
  }
}


