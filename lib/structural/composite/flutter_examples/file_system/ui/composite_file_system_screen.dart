import 'package:flutter/material.dart';
import 'package:design_patterns_flutter/structural/composite/flutter_examples/file_system/file_system_components.dart';
import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';

class CompositeFileSystemScreen extends StatefulWidget {
  const CompositeFileSystemScreen({super.key});

  @override
  State<CompositeFileSystemScreen> createState() => _CompositeFileSystemScreenState();
}

class _CompositeFileSystemScreenState extends State<CompositeFileSystemScreen> {
  late final DirectoryItem _rootDirectory;

  @override
  void initState() {
    super.initState();
    // 🔹 Build the complex tree structure once in InitState
    _rootDirectory = DirectoryItem('Root (C:)');

    // Design branch
    final designDir = DirectoryItem('Design Assets');
    designDir.addComponent(FileItem('Logo.png', 450, Icons.image));
    designDir.addComponent(FileItem('Background.jpg', 1200, Icons.image));
    
    // Code branch (Includes another nested branch)
    final codeDir = DirectoryItem('Source Code');
    codeDir.addComponent(FileItem('main.dart', 15, Icons.code));
    codeDir.addComponent(FileItem('pubspec.yaml', 3, Icons.settings));
    
    final utilsDir = DirectoryItem('Utils'); // Nested!
    utilsDir.addComponent(FileItem('constants.dart', 5, Icons.code));
    utilsDir.addComponent(FileItem('api_helper.dart', 20, Icons.api));
    
    codeDir.addComponent(utilsDir); // Adding a composite to another composite!

    // Root branch additions
    _rootDirectory.addComponent(designDir);
    _rootDirectory.addComponent(codeDir);
    _rootDirectory.addComponent(FileItem('README.md', 2, Icons.description));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Composite Pattern Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // 🔹 The Magic Call: We treat the entire complex tree as if 
                    // it were a single widget. The Composite Pattern handles the rest!
                    child: _rootDirectory.buildWidget(context),
                  ),
                ),
              ],
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: PatternDefinitionCard(
              title: 'Composite Pattern',
              description: 'Compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and compositions uniformly.',
              exampleContext: 'The entire file system—folders and files—is rendered and behaves consistently as a single structure. Expanding folders, displaying nested content, and calculating total sizes all happen seamlessly, even with deeply nested items. This demonstrates how both individual elements and grouped elements are handled uniformly.',
            ),
          ),
        ],
      ),
    );
  }
}
