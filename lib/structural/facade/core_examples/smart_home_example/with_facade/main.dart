import 'smart_home_facade.dart';

void main() {
  final facade = SmartHomeFacade();

  // The client interaction is now clean and secondary to the coordination logic
  facade.watchMovie();

  print('\n----------------------------------------\n');

  facade.stopMovie();

  print('\n----------------------------------------\n');

  facade.goToSleep();
}
