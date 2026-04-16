import 'package:flutter/material.dart';

// --- Subsystems (Simple & Straightforward) ---

class ImageCompressor {
  String compress(String imagePath) {
    print('Compressing image at $imagePath...');
    return '$imagePath (compressed)';
  }
}

class ActionLogger {
  void log(String message) {
    print('Log entry: $message');
  }
}

class SocialApi {
  void upload(String data) {
    print('Uploading data to server: $data');
  }
}

// --- The Facade: Hides the steps above ---

class SocialShareFacade extends ChangeNotifier {
  final ImageCompressor _compressor = ImageCompressor();
  final ActionLogger _logger = ActionLogger();
  final SocialApi _api = SocialApi();

  String _lastStatus = 'Ready to share';
  String get lastStatus => _lastStatus;

  // 🔹 Simple Interface: The point of the Facade
  void sharePost(String imagePath) {
    // Stage 1: Compress
    final compressedImage = _compressor.compress(imagePath);
    
    // Stage 2: Log
    _logger.log('User shared $compressedImage');
    
    // Stage 3: Upload
    _api.upload(compressedImage);
    
    _lastStatus = 'Post shared successfully!';
    notifyListeners();
  }

  void reset() {
    _lastStatus = 'Ready to share';
    notifyListeners();
  }
}
