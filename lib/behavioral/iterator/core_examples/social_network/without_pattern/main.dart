import 'social_network_without_iterator.dart';

void main() {
  print('=============================================');
  print('  ITERATOR - WITHOUT PATTERN                 ');
  print('=============================================\n');

  // Initialize the network with our hardcoded profiles
  final network = SocialNetworkWithoutPattern();
  
  // The client app has to tightly couple itself to the network's data structure
  final client = ClientApp();
  
  client.displayProfiles(network);
  
  print('\n=============================================');
}
