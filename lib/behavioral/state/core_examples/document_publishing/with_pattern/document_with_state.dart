/// -------------------------------------------------------------
/// WITH STATE PATTERN
/// -------------------------------------------------------------
/// We encapsulate the varying behaviors (publishing / rendering logic)
/// into distinct State classes. The `Document` delegates execution to
/// its currently held State object.

// Abstract State
abstract class State {
  late Document document;

  void setContext(Document document) {
    this.document = document;
  }

  // Standard behaviors that all states must handle
  void publish();
  void render();
}

// Context
class Document {
  // We favor composition. The `Document` is composed of a `State`.
  late State _state;
  String currentUserRole;

  Document(this.currentUserRole) {
    // Initial State
    transitionTo(DraftState());
  }

  // The Context explicitly handles state transitions by pointing
  // to a new State object instance.
  void transitionTo(State state) {
    print('Context: Transitioning to -> ${state.runtimeType}');
    _state = state;
    _state.setContext(this);
  }

  // The Context simply delegates the work to whatever state is currently active.
  void publish() => _state.publish();
  void render() => _state.render();
}

// Concrete State: Draft
class DraftState extends State {
  @override
  void publish() {
    // Solution 1: Logic specific to "Draft" is isolated here!
    if (document.currentUserRole == 'admin') {
      print('DraftState: Admin published directly.');
      document.transitionTo(PublishedState());
    } else {
      print('DraftState: Sending to moderation.');
      document.transitionTo(ModerationState());
    }
  }

  @override
  void render() {
    if (document.currentUserRole == 'author' || document.currentUserRole == 'admin') {
      print('DraftState: Rendering Draft Document... (Editable)');
    } else {
      print('DraftState: Access denied.');
    }
  }
}

// Concrete State: Moderation
class ModerationState extends State {
  @override
  void publish() {
    if (document.currentUserRole == 'admin') {
      print('ModerationState: Admin approved and published.');
      document.transitionTo(PublishedState());
    } else {
      // Solution 2: Clean and localized failure states without huge conditionals.
      print('ModerationState: Authors cannot publish from moderation.');
    }
  }

  @override
  void render() {
    print('ModerationState: Rendering Document in Moderation... (Read-only)');
  }
}

// Concrete State: Published
class PublishedState extends State {
  @override
  void publish() {
    print('PublishedState: Document is already published. No action taken.');
  }

  @override
  void render() {
    print('PublishedState: Rendering Published Document... (Public)');
  }
}
