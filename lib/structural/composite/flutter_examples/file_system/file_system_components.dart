import 'package:flutter/material.dart';


/// -------------------------------------------------------------
/// 🧠 Example Context: File System (Composite Pattern)
/// -------------------------------------------------------------
/// Think about how a real file system works:
///
/// - You have individual files (like images, code files, documents).
/// - You also have folders (directories) that can contain:
///     • files
///     • other folders (nested structure)
///
/// Example:
/// Root Folder
///   ├── Design Assets
///   │     ├── Logo.png
///   │     └── Background.jpg
///   ├── Source Code
///   │     ├── main.dart
///   │     └── Utils
///   │           ├── constants.dart
///   │           └── api_helper.dart
///   └── README.md
///
/// 💡 The key idea:
/// A folder and a file should be treated the SAME way.
///
/// For example:
/// - Get total size → works for file OR folder
/// - Render UI → works for file OR folder
///
/// 👉 This is what the Composite Pattern solves:
/// It allows us to treat individual objects (files)
/// and groups of objects (folders) uniformly.
///
/// In this example:
/// - FileItem = Leaf (single file)
/// - DirectoryItem = Composite (can contain files or folders)
/// - FileSystemComponent = common interface

// -------------------------------------------------------------
// 🔹 1. Component (The common interface)
// -------------------------------------------------------------
// This abstract class provides a uniform interface for both individual files
// and complex directories. It dictates how they should calculate their size
// and how they should render themselves in Flutter.
abstract class FileSystemComponent {
  final String name;

  FileSystemComponent(this.name);

  // Operation to calculate total size
  int getSize();

  // Operation to render its corresponding UI Widget
  Widget buildWidget(BuildContext context);
}

// -------------------------------------------------------------
// 🔹 2. Leaf (Atomic Element)
// -------------------------------------------------------------
// Represents a single file. It does not have children.
class FileItem extends FileSystemComponent {
  final int sizeInKb;
  final IconData icon;

  FileItem(super.name, this.sizeInKb, this.icon);

  @override
  int getSize() => sizeInKb;

  @override
  Widget buildWidget(BuildContext context) {
    // A Leaf simply renders itself as a simple List Item.
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(name),
      subtitle: Text('$sizeInKb KB'),
      dense: true,
      contentPadding: const EdgeInsets.only(left: 32.0, right: 16.0),
    );
  }
}

// -------------------------------------------------------------
// 🔹 3. Composite (Container Element)
// -------------------------------------------------------------
// Represents a directory that can contain multiple files or other directories.
class DirectoryItem extends FileSystemComponent {
  final List<FileSystemComponent> _components = [];

  DirectoryItem(super.name);

  void addComponent(FileSystemComponent component) {
    _components.add(component);
  }

  @override
  int getSize() {
    // 🔹 Recursive Size Calculation
    // Calculates the total size of everything inside this directory (and subdirectories).
    return _components.fold(0, (total, component) => total + component.getSize());
  }

  @override
  Widget buildWidget(BuildContext context) {
    // 🔹 Recursive UI Rendering
    // A Composite renders itself as an expandable tile, and automatically
    // asks all of its children to render themselves inside of it without
    // caring if the child is a simple File or another nested Directory!
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: const Icon(Icons.folder, color: Colors.amber),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${getSize()} KB Total Fold Size', style: const TextStyle(fontSize: 12)),
        // The magic happens here! Uniform delegation to `.buildWidget()`
        children: _components.map((c) => c.buildWidget(context)).toList(),
      ),
    );
  }
}
