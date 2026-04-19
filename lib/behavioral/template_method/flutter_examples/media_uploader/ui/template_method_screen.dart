import 'dart:async';
import 'package:flutter/material.dart';
import 'package:design_patterns_flutter/behavioral/template_method/flutter_examples/media_uploader/media_uploader.dart';
import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';

class TemplateMethodScreen extends StatefulWidget {
  const TemplateMethodScreen({super.key});

  @override
  State<TemplateMethodScreen> createState() => _TemplateMethodScreenState();
}

class _TemplateMethodScreenState extends State<TemplateMethodScreen> {
  final List<UploadLog> _logs = [];
  double _currentProgress = 0.0;
  bool _isUploading = false;
  StreamSubscription? _subscription;
  String _activeUploaderName = '';

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _startUpload(BaseMediaUploader uploader, String name) {
    if (_isUploading) return;

    setState(() {
      _logs.clear();
      _currentProgress = 0.0;
      _isUploading = true;
      _activeUploaderName = name;
    });

    _subscription = uploader.uploadMedia().listen(
      (log) {
        setState(() {
          _logs.add(log);
          _currentProgress = log.progress;
        });
      },
      onDone: () {
        setState(() {
          _isUploading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template Method: Media Uploader'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          // Control Panel
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Select Media to Upload:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildUploadButton(
                  icon: Icons.image,
                  label: 'Image',
                  color: Colors.blue,
                  uploader: ImageUploader(),
                ),
                _buildUploadButton(
                  icon: Icons.video_library,
                  label: '4K Video',
                  color: Colors.deepPurple,
                  uploader: VideoUploader(),
                ),
                _buildUploadButton(
                  icon: Icons.audiotrack,
                  label: 'Audio',
                  color: Colors.orange,
                  uploader: AudioPodcastUploader(),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Progress Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_activeUploaderName.isEmpty ? 'Idle' : 'Uploading $_activeUploaderName...', style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('${(_currentProgress * 100).toInt()}%'),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: _currentProgress,
                    minHeight: 12,
                    backgroundColor: Colors.grey[300],
                    color: _activeUploaderName == 'Image' 
                        ? Colors.blue 
                        : _activeUploaderName == '4K Video' 
                            ? Colors.deepPurple 
                            : Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Console Logs
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: _logs.isEmpty
                  ? const Center(
                      child: Text(
                        'Awaiting upload command...',
                        style: TextStyle(color: Colors.white54, fontFamily: 'monospace'),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _logs.length,
                      itemBuilder: (context, index) {
                        final log = _logs[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            log.message,
                            style: TextStyle(
                              fontSize: 13,
                              color: log.isCompleted
                                  ? Colors.greenAccent
                                  : log.isSpecificStep
                                      ? Colors.lightBlueAccent
                                      : Colors.white,
                              fontFamily: 'monospace',
                              fontWeight: (log.isCompleted || log.isSpecificStep) 
                                  ? FontWeight.bold 
                                  : FontWeight.normal,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: PatternDefinitionCard(
              title: 'Template Method Pattern',
              description:
                  'Defines the skeleton of an algorithm in the base class, letting subclasses override specific steps without changing the structure.',
              exampleContext:
                  'This pattern ensures that the upload process always follows a fixed sequence enforced by the base class, while allowing subclasses to customize only specific predefined steps without changing the overall structure.',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadButton({
    required IconData icon,
    required String label,
    required Color color,
    required BaseMediaUploader uploader,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton.icon(
          onPressed: _isUploading ? null : () => _startUpload(uploader, label),
          icon: Icon(icon, size: 20, color: Colors.white),
          label: Text(label, style: const TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            disabledBackgroundColor: color.withOpacity(0.3),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}
