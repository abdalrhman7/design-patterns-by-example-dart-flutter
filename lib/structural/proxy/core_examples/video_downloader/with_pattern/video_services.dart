/// -------------------------------------------------------------
/// WITH PROXY PATTERN
/// -------------------------------------------------------------
/// We define an interface so the Proxy and the Real Service
/// can be used interchangeably by the client.
library;

abstract class VideoInterface {
  void playVideo(String videoId);
  void getDescription(String videoId);
}

class RealVideoService implements VideoInterface {
  RealVideoService() {
    _loadMetadata();
  }

  void _loadMetadata() {
    print('RealVideoService: Loading heavy metadata... (EXPENSIVE)');
  }

  @override
  void playVideo(String videoId) {
    print('RealVideoService: Playing binary data of $videoId');
  }

  @override
  void getDescription(String videoId) {
    print('RealVideoService: Returning cached description for $videoId');
  }
}

class VideoProxy implements VideoInterface {
  // We keep a reference to the real service
  RealVideoService? _realService;
  final bool isPremiumUser;

  VideoProxy({this.isPremiumUser = false});

  @override
  void playVideo(String videoId) {
    // Solution 1: Protection Proxy (Access Control)
    if (!isPremiumUser) {
      print('VideoProxy: Access Denied. "$videoId" is for premium users only.');
      return;
    }

    // Solution 2: Virtual Proxy (Lazy Loading)
    // We only create the expensive object when a valid request is actually made.
    _realService ??= RealVideoService();

    _realService!.playVideo(videoId);
  }

  @override
  void getDescription(String videoId) {
    // We can also perform caching or logging here
    print('VideoProxy: Logging request for description of $videoId');

    _realService ??= RealVideoService();
    _realService!.getDescription(videoId);
  }
}
