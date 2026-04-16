import 'smart_home_without_facade.dart';

void main() {
  final client = SmartHomeClient();

  // The client is forced to deal with complex internal systems
  client.watchMovie();

  print('\n----------------------------------------\n');

  client.stopMovie();
}
