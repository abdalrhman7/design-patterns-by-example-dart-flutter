import 'package:flutter/material.dart';
import 'package:design_patterns_flutter/behavioral/iterator/flutter_examples/timeline_stepper/timeline_iterator.dart';
import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';

class IteratorTimelineScreen extends StatefulWidget {
  const IteratorTimelineScreen({super.key});

  @override
  State<IteratorTimelineScreen> createState() => _IteratorTimelineScreenState();
}

class _IteratorTimelineScreenState extends State<IteratorTimelineScreen> {
  // 🔹 The UI only talks to the Collection Interface, never the concrete List.
  final TimelineCollection _collection = UserTimeline();
  
  // 🔹 The Iterator instance maintains the cursor and handles logic.
  late TimelineIterator _iterator;

  @override
  void initState() {
    super.initState();
    // 🔹 1. We ask the collection for its iterator.
    _iterator = _collection.createIterator();
    // The UI handles no index/cursor logic; it's completely abstracted.
  }

  void _goNext() {
    // 🔹 2. UI asks the iterator if it's safe to traverse.
    if (_iterator.hasNext()) {
      setState(() {
        // 🔹 3. Iterator handles standardizing the traversal internally.
        _iterator.next();
      });
    }
  }

  void _goPrevious() {
    if (_iterator.hasPrevious()) {
      setState(() {
        _iterator.previous();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 🔹 Read the currently focused item from the iterator cleanly.
    final currentPost = _iterator.current(); 

    return Scaffold(
      appBar: AppBar(title: const Text('Iterator Pattern Demo')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            _buildProgressIndicator(),
            const SizedBox(height: 24),

            // The Main Display Area
               _buildPostCard(currentPost),

            // The Navigation Controls
            _buildControls(),

            const Padding(
              padding: EdgeInsets.only(left : 16 , right : 16 , bottom: 16 ),
              child: PatternDefinitionCard(
                title: 'Iterator Pattern',
                description: 'Allows sequential access to elements of an aggregate object without exposing its underlying internal representation.',
                exampleContext: 'The UI acts purely as a client calling `iterator.next()`, `previous()`, and `current()`. It has ZERO idea if the timeline is backed by an Array, a Database connection, or a Linked List. The Concrete Iterator completely encapsulates the complex cursor index logic.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Text(
            'Milestone ${_iterator.currentIndex() + 1} of ${_iterator.totalCount()}',
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: (_iterator.currentIndex() + 1) / _iterator.totalCount(),
            backgroundColor: Colors.grey[300],
            color: Colors.deepPurple,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard(TimelinePost post) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: Card(
        // Key bound to Iterator's state tells Flutter when to trigger animations
        key: ValueKey<int>(_iterator.currentIndex()),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.deepPurple[100],
                child: Icon(post.icon, size: 40, color: Colors.deepPurple),
              ),
              const SizedBox(height: 16),
              Text(
                post.date,
                style: TextStyle(color: Colors.deepPurple[800], fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                post.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                post.content,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: _iterator.hasPrevious() ? _goPrevious : null,
            icon: const Icon(Icons.arrow_back),
            label: const Text('Previous'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          ElevatedButton(
            onPressed: _iterator.hasNext() ? _goNext : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Next Milestone'),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
