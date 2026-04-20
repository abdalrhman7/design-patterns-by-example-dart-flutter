// Models
class Profile {
  final String name;
  final bool isActive;

  Profile(this.name, this.isActive);
}

// -------------------------------------------------------------
// 🔹 Iterator Interfaces
// -------------------------------------------------------------

// Iterator Interface
// Provides standard traversal methods.
abstract class ProfileIterator {
  bool hasNext();
  Profile next();
}

// Iterable Collection Interface
// Defines how to get an iterator.
abstract class SocialNetwork {
  ProfileIterator createAllProfilesIterator();
  ProfileIterator createActiveProfilesIterator();
}

// -------------------------------------------------------------
// 🔹 Concrete Collections
// -------------------------------------------------------------

// Extracted from client view, now encapsulated.
class ConcreteSocialNetwork implements SocialNetwork {
  // 🔹 The internal representation is completely hidden. 
  // It could be a List, Map, Tree etc. The client won't care.
  final List<Profile> _profiles = [];

  void addProfile(Profile profile) {
    _profiles.add(profile);
  }

  @override
  ProfileIterator createAllProfilesIterator() {
    return AllProfilesIterator(this);
  }

  @override
  ProfileIterator createActiveProfilesIterator() {
    return ActiveProfilesIterator(this);
  }

  // A getter meant ONLY for our iterators, not the general public client.
  List<Profile> get internalProfiles => _profiles;
}

// -------------------------------------------------------------
// 🔹 Concrete Iterators
// -------------------------------------------------------------

class AllProfilesIterator implements ProfileIterator {
  final ConcreteSocialNetwork _network;
  int _currentPosition = 0;

  AllProfilesIterator(this._network);

  @override
  bool hasNext() {
    return _currentPosition < _network.internalProfiles.length;
  }

  @override
  Profile next() {
    if (hasNext()) {
      return _network.internalProfiles[_currentPosition++];
    }
    throw StateError('No more elements');
  }
}

class ActiveProfilesIterator implements ProfileIterator {
  final ConcreteSocialNetwork _network;
  int _currentPosition = 0;

  ActiveProfilesIterator(this._network);

  @override
  bool hasNext() {
    // Traverse ahead to find if the NEXT one is active
    while (_currentPosition < _network.internalProfiles.length) {
      if (_network.internalProfiles[_currentPosition].isActive) {
        return true;
      }
      _currentPosition++;
    }
    return false;
  }

  @override
  Profile next() {
    if (hasNext()) {
      // Return the current active and move pointer
      return _network.internalProfiles[_currentPosition++];
    }
    throw StateError('No more elements');
  }
}
