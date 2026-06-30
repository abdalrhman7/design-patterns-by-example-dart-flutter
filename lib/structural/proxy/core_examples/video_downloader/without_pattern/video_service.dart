/// -------------------------------------------------------------
/// WITHOUT PROXY PATTERN
/// -------------------------------------------------------------
/// Here, the client directly uses the heavy `VideoService`.
/// The problem is that the service performs expensive initialization
/// (like connecting to a remote API and loading mega-bytes of data)
/// immediately upon creation, even if it might never be used.
library;

class RawVideoService {
  RawVideoService() {
    _loadMetadata();
  }

  void _loadMetadata() {
    print(
        'RawVideoService: Loading heavy metadata from remote server... (EXPENSIVE)');
    // Simulate a slow loading process
    print('RawVideoService: Metadata loaded for 1000+ videos. (Memory heavy)');
  }

  void playVideo(String videoId) {
    print('RawVideoService: Playing video -> $videoId');
  }

  void getDescription(String videoId) {
    print('RawVideoService: Returning description for $videoId');
  }
}
