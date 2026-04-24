import 'video_services.dart';

void main() {
  print('--- Client: Initializing the app with a Proxy... ---');
  
  // Solution: Initialization is instant! 
  // The heavy RealVideoService is NOT created yet.
  final VideoInterface videoLibrary = VideoProxy(isPremiumUser: false);

  print('\n--- Client: User is just browsing titles (No resources wasted) ---');

  print('\n--- Client: Free user tries to play a video ---');
  videoLibrary.playVideo('Advanced_Architecture_01'); 
  // Handled entirely by proxy without touching the real service.

  print('\n--- Client: Switching to a Premium User ---');
  final VideoInterface premiumLibrary = VideoProxy(isPremiumUser: true);

  print('\n--- Client: Premium user plays a video ---');
  // ONLY NOW the RealVideoService is instantiated (Lazy Loading).
  premiumLibrary.playVideo('Advanced_Architecture_01');
  
  print('\n--- Client: Second request (No re-initialization) ---');
  premiumLibrary.playVideo('Clean_Code_Course');
}
