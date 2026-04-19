import 'dart:async';
import 'package:flutter/foundation.dart';

/// Represents a log entry emitted during the upload process.
/// Used by the UI to visualize the algorithm's execution flow.
class UploadLog {
  final String message;
  final double progress;
  final bool isCompleted;
  final bool isSpecificStep;

  UploadLog(this.message, this.progress, {this.isCompleted = false, this.isSpecificStep = false});
}

/// Abstract Base Class: The Template
/// 🔹 Defines the strict algorithm flow for processing and uploading media.
abstract class BaseMediaUploader {
  
  /// 🔹 The Template Method
  /// This method is the core of the pattern. It dictates the exact sequence
  /// of steps required to upload media safely, ensuring no subclass skips a step.
  Stream<UploadLog> uploadMedia() async* {
    yield UploadLog('1. Initializing upload pipeline...', 0.1);
    await Future.delayed(const Duration(milliseconds: 600));

    // Call Abstract Method
    yield UploadLog('2. Selecting media file...', 0.2);
    final fileName = await selectMedia();
    yield UploadLog('   Loaded: $fileName', 0.3, isSpecificStep: true);
    await Future.delayed(const Duration(milliseconds: 800));

    // Evaluate Hook: Compression
    if (shouldCompress()) {
      yield UploadLog('3. Compression hook enabled. Compressing...', 0.4);
      // Call Abstract Method
      final result = await compressMedia();
      yield UploadLog('   Result: $result', 0.6, isSpecificStep: true);
    } else {
      yield UploadLog('3. Skipping compression (Hook evaluated to false)', 0.6);
    }
    await Future.delayed(const Duration(milliseconds: 800));

    // Evaluate Hook: Watermark
    if (shouldApplyWatermark()) {
      yield UploadLog('4. Watermark hook enabled. Applying...', 0.7);
      // Call Hook Method
      await applyWatermark();
      yield UploadLog('   Brand watermark applied permanently.', 0.8, isSpecificStep: true);
    } else {
      yield UploadLog('4. Skipping watermark (Not required for this media type)', 0.8);
    }
    await Future.delayed(const Duration(milliseconds: 800));

    // Shared / Common Step
    yield UploadLog('5. Connecting to secure server and uploading bytes...', 0.9);
    await _uploadToServer();
    
    yield UploadLog('   Upload Complete! 🎉', 1.0, isCompleted: true);
  }

  // -------------------------------------------------------------
  // 🔹 Abstract Methods (Must be implemented by concrete subclasses)
  // -------------------------------------------------------------
  
  @protected
  Future<String> selectMedia();

  @protected
  Future<String> compressMedia();

  // -------------------------------------------------------------
  // 🔹 Hooks (Optional overrides that change the algorithm's path)
  // -------------------------------------------------------------
  
  /// Hook: Should we compress the file? (Default: true)
  @protected
  bool shouldCompress() => true;

  /// Hook: Should we apply a watermark? (Default: false)
  @protected
  bool shouldApplyWatermark() => false;

  /// Hook Implementation: Logic for applying watermark.
  /// Subclasses can override how the watermark is applied if they need to.
  @protected
  Future<void> applyWatermark() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  // -------------------------------------------------------------
  // 🔹 Common Methods (Shared logic hidden from subclasses)
  // -------------------------------------------------------------
  Future<void> _uploadToServer() async {
    // E.g., HTTP POST request logic goes here
    await Future.delayed(const Duration(seconds: 1));
  }
}

/// Concrete Subclass 1: Image Uploader
class ImageUploader extends BaseMediaUploader {
  @override
  Future<String> selectMedia() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return 'IMG_2026_04_19.jpg (4.2 MB)';
  }

  @override
  Future<String> compressMedia() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return 'Optimized to WebP at 80% quality (800 KB)';
  }

  // 🔹 Override Hook: Images always get a watermark
  @override
  bool shouldApplyWatermark() => true;
}

/// Concrete Subclass 2: 4K Video Uploader
class VideoUploader extends BaseMediaUploader {
  @override
  Future<String> selectMedia() async {
    await Future.delayed(const Duration(milliseconds: 700));
    return 'VID_VACATION_4K.mp4 (1.5 GB)';
  }

  @override
  Future<String> compressMedia() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Transcoded from 4K to 1080p, H.264 encoded (250 MB)';
  }

  // Videos use default watermark hook (false), so no watermark is applied.
}

/// Concrete Subclass 3: Audio Podcast Uploader
class AudioPodcastUploader extends BaseMediaUploader {
  @override
  Future<String> selectMedia() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return 'Podcast_EP10.wav (45 MB)';
  }

  @override
  Future<String> compressMedia() async {
    // This will never be called because the hook disables it.
    throw UnimplementedError('Audio compression is disabled.');
  }

  // 🔹 Override Hook: Audio is uploaded Lossless, skip compression
  @override
  bool shouldCompress() => false;

  // Audio cannot have visual watermarks
  @override
  bool shouldApplyWatermark() => false;
}
