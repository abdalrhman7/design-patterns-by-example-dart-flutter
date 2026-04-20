import 'social_network_with_iterator.dart';

// Test Client Code
void main() {
  print('=============================================');
  print('  ITERATOR - WITH PATTERN                    ');
  print('=============================================\n');

  final network = ConcreteSocialNetwork();
  network.addProfile(Profile('Alice', true));
  network.addProfile(Profile('Bob', false));
  network.addProfile(Profile('Charlie', true));
  network.addProfile(Profile('Diana', false));

  // 🔹 The client doesn't know about Maps or Lists!
  // 🔹 It just asks the collection for an iterator, and loops until 'hasNext()' is false.

  print('--- All Profiles ---');
  final allIterator = network.createAllProfilesIterator();
  while (allIterator.hasNext()) {
    print(allIterator.next().name);
  }

  print('\n--- Active Profiles ---');
  final activeIterator = network.createActiveProfilesIterator();
  
  // Here we see the magic: The exact same while-loop structure!
  // The complexity of filtering by 'isActive' is totally hidden from the client.
  while (activeIterator.hasNext()) {
    print(activeIterator.next().name);
  }

  print('\n=============================================');
}
