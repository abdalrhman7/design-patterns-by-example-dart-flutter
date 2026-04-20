import 'package:flutter/material.dart';

// -------------------------------------------------------------
// 🔹 Iterator Pattern: UI Flutter Example (Pagination/Timeline)
// -------------------------------------------------------------

/// 🔹 1. Collection Interface
/// Defines how a client can get an iterator for this collection.
abstract class TimelineCollection {
  TimelineIterator createIterator();
}

/// 🔹 2. Iterator Interface
/// Defines the standardized methods to traverse the timeline.
/// We use a Bidirectional approach suitable for UIs (Next/Prev/Current)
abstract class TimelineIterator {
  bool hasNext();
  bool hasPrevious();

  /// Moves cursor forward and returns the new item.
  TimelinePost next();

  /// Moves cursor backward and returns the new item.
  TimelinePost previous();

  /// Reads the current item without moving the cursor.
  /// (Perfect for UI initial states, removing hacky workarounds).
  TimelinePost current();

  // UI Helpers (optional, but practical for Flutter progress bars)
  int currentIndex();
  int totalCount();
}

/// 🔹 The Data Model
class TimelinePost {
  final String date;
  final String title;
  final String content;
  final IconData icon;

  TimelinePost(this.date, this.title, this.content, this.icon);
}

/// 🔹 3. Concrete Collection
/// Focuses purely on storing data, hiding its structure (List) from clients.
class UserTimeline implements TimelineCollection {
  // 🔹 Encapsulated data structure (could easily be a DB result or a Graph)
  final List<TimelinePost> _posts = [
    TimelinePost('Jan 2020', 'Joined Company', 'Started my career as a Junior Dev.', Icons.work),
    TimelinePost('Mar 2021', 'First Big Release', 'Deployed the new payment gateway.', Icons.rocket_launch),
    TimelinePost('Sep 2022', 'Promoted', 'Became a Mid-level Software Engineer.', Icons.star),
    TimelinePost('Dec 2023', 'Led a Project', 'Architected the rewrite of the core app.', Icons.architecture),
    TimelinePost('Present', 'Tech Lead', 'Currently leading the mobile team.', Icons.group),
  ];

  @override
  TimelineIterator createIterator() {
    return _LinearTimelineIterator(_posts);
  }
}

/// 🔹 4. Concrete Iterator
/// Takes the responsibility of traversal algorithms and maintaining the cursor.
class _LinearTimelineIterator implements TimelineIterator {
  final List<TimelinePost> _collection;
  
  // 🔹 The Iterator tracks its own state, completely decoupled from the UI
  int _currentIndex = 0; 

  _LinearTimelineIterator(this._collection);

  // Checks if we can safely move forward
  @override
  bool hasNext() => _currentIndex < _collection.length - 1;

  // Checks if we can safely move backward
  @override
  bool hasPrevious() => _currentIndex > 0;

  // Views current element without side-effects
  @override
  TimelinePost current() {
    if (_collection.isEmpty) {
      throw StateError("The timeline collection is empty.");
    }
    return _collection[_currentIndex];
  }

  // Advances internal state and returns the result safely
  @override
  TimelinePost next() {
    if (hasNext()) {
      _currentIndex++;
    }
    return current();
  }

  // Reverses internal state and returns the result safely
  @override
  TimelinePost previous() {
    if (hasPrevious()) {
      _currentIndex--;
    }
    return current();
  }

  @override
  int currentIndex() => _currentIndex;

  @override
  int totalCount() => _collection.length;
}
