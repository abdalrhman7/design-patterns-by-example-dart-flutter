import 'document_without_state.dart';

void main() {
  print('--- Testing Document Lifecycle (Without Pattern) ---');
  final doc = Document('author');
  
  doc.render(); // Access draft
  doc.publish(); // Move to moderation
  doc.render(); // View moderation
  doc.publish(); // Try to publish, fails
  
  print('\n--- Admin takes over ---');
  doc.currentUserRole = 'admin'; // Change role
  doc.publish(); // Approved
  doc.render(); // Public
}
