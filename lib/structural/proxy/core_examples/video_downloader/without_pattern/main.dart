import 'video_service.dart';

void main() {
  print('--- Client: Initializing the app... ---');
  
  // Problem 1: Even if we only want to list titles, we initialize everything.
  // Tight coupling means we are forced to pay the "Expensive Initialization" cost upfront.
  final service = RawVideoService();

  print('\n--- Client: Deciding what to do... ---');
  // At this point, the user hasn't even clicked anything, but the app is already slow.

  print('\n--- Client: User finally clicks a video ---');
  service.playVideo('Design_Patterns_01');
  
  // Problem 2: There is no control over access.
  // If we wanted to add a "Premium Check" later, we would have to mess up 
  // the RawVideoService's internal logic, violating the Open/Closed Principle.
}
