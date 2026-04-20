// Models
class Profile {
  final String name;
  final bool isActive;

  Profile(this.name, this.isActive);
}

// Without Iterator Pattern
// Demonstrates the problems of tight coupling and lack of encapsulation.

class SocialNetworkWithoutPattern {
  // 🔹 Problem 1: Internal representation is fully exposed.
  // We made this public so the client can loop over it. 
  // If we change it to a Set or a Graph later, all client code breaks.
  List<Profile> profiles = [
    Profile('Alice', true),
    Profile('Bob', false),
    Profile('Charlie', true),
    Profile('Diana', false),
  ];
}

class ClientApp {
  void displayProfiles(SocialNetworkWithoutPattern network) {
    // 🔹 Problem 2: The client implements the traversal logic.
    // Traversing "all" profiles:
    print('--- All Profiles ---');
    for (int i = 0; i < network.profiles.length; i++) {
      print(network.profiles[i].name);
    }

    // 🔹 Problem 3: The client implements filtering traversal logic.
    // Traversing "only active" profiles:
    print('--- Active Profiles ---');
    for (int i = 0; i < network.profiles.length; i++) {
      if (network.profiles[i].isActive) {
        print(network.profiles[i].name);
      }
    }

    // 🔹 Problem 4: If we want to iterate backward, or by some specific sorting,
    // the client has to write the logic again, duplicating code across the app.
  }
}
