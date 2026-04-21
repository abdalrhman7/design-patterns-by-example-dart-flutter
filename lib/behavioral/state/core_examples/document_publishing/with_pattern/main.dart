import 'document_with_state.dart';

void main() {
  print('--- Testing Document Lifecycle (With Pattern) ---');
  final doc = Document('author');

  doc.render(); // Handled by DraftState
  doc.publish(); // Handled by DraftState -> transitions to ModerationState
  
  doc.render(); // Handled by ModerationState
  doc.publish(); // Handled by ModerationState (fails)
  
  print('\n--- Admin takes over ---');
  doc.currentUserRole = 'admin';
  doc.publish(); // Handled by ModerationState -> transitions to PublishedState
  doc.render(); // Handled by PublishedState
}
