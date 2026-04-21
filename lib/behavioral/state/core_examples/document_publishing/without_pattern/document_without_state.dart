/// -------------------------------------------------------------
/// WITHOUT STATE PATTERN
/// -------------------------------------------------------------
/// Here, the `Document` class manages its own state using an `enum`.
/// Notice how every behavior method requires a massive `switch`
/// or `if-else` statement to figure out what to do based on the current state.
/// This violates the Single Responsibility Principle and Open/Closed Principle.

enum DocumentState { draft, moderation, published }

class Document {
  DocumentState state = DocumentState.draft;
  String currentUserRole;

  Document(this.currentUserRole);

  void publish() {
    // Problem 1: Massive conditional logic based on state. 
    // It's tangled and tightly coupled.
    // Problem 2: Violates Open/Closed Principle. If we add an "Archived" state, 
    // we must modify this existing method!
    if (state == DocumentState.draft) {
      if (currentUserRole == 'admin') {
        state = DocumentState.published;
        print('Document published immediately by admin.');
      } else {
        state = DocumentState.moderation;
        print('Document sent to moderation.');
      }
    } else if (state == DocumentState.moderation) {
      if (currentUserRole == 'admin') {
        state = DocumentState.published;
        print('Document approved and published.');
      } else {
        print('Only admin can approve in moderation.');
      }
    } else if (state == DocumentState.published) {
      print('Document is already published. Nothing to do.');
    }
  }

  void render() {
    // Problem 3: The conditional checks are repeated AGAIN here in this method.
    // Code duplication is high, making debugging a nightmare.
    if (state == DocumentState.draft) {
      if (currentUserRole == 'author' || currentUserRole == 'admin') {
        print('Rendering Draft Document... (Editable)');
      } else {
        print('Access denied to Draft.');
      }
    } else if (state == DocumentState.moderation) {
      print('Rendering Document in Moderation... (Read-only)');
    } else if (state == DocumentState.published) {
      print('Rendering Published Document... (Public)');
    }
  }
}
