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

class SocialShareFacade {
  final ImageCompressor _compressor = ImageCompressor();
  final ActionLogger _logger = ActionLogger();
  final SocialApi _api = SocialApi();

  // 🔹 Simple Interface: Plain Dart method without any Flutter dependencies
  void sharePost(String imagePath) {
    // Stage 1: Compress
    final compressedImage = _compressor.compress(imagePath);

    // Stage 2: Log
    _logger.log('User shared $compressedImage');

    // Stage 3: Upload
    _api.upload(compressedImage);
  }
}
