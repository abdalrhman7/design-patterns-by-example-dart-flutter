// === Subsystems (Independent Components with Single Responsibilities) ===

class ImageCompressor {
  // 🔹 Responsibility: Reduce image size before sending it over network
  // This is a low-level operation that the client should NOT be aware of
  String compress(String imagePath) {
    print('Compressing image at $imagePath...');
    return '$imagePath (compressed)';
  }
}

class ActionLogger {
  // 🔹 Responsibility: Track system/user actions for debugging or analytics
  // This is a cross-cutting concern and should not be handled by the UI
  void log(String message) {
    print('Log entry: $message');
  }
}

class SocialApi {
  // 🔹 Responsibility: Handle communication with backend services
  // Encapsulates network/API complexity from the rest of the system
  void upload(String data) {
    print('Uploading data to server: $data');
  }
}

// -------------------------------------------------------------------------

// Facade: The Simplified Interface
// 🔹 Provides a single entry point for a complex multi-step workflow
// 🔹 Hides coordination between compression, logging, and uploading

class SocialShareFacade {
  final ImageCompressor _compressor = ImageCompressor();
  final ActionLogger _logger = ActionLogger();
  final SocialApi _api = SocialApi();

  // 🔹 High-level operation exposed to the client
  // The client does NOT need to know:
  // - how image compression works
  // - when logging happens
  // - how data is uploaded
  void sharePost(String imagePath) {
    print('--- 📤 Facade: Starting Share Workflow ---');

    // Step 1: Prepare data (reduce size before sending)
    final compressedImage = _compressor.compress(imagePath);

    // Step 2: Track action (for monitoring/debugging)
    _logger.log('User shared $compressedImage');

    // Step 3: Send to remote server
    _api.upload(compressedImage);
  }
}