
// === Usage With Abstract Factory Pattern ===
import 'button_checkbox_factory.dart';

void main() {
  print('--- UI Rendering WITH Abstract Factory Pattern ---');

  // Case 1: Client using Light Theme
  print('\nRendering Light Theme:');
  UIClient lightApp = UIClient(LightUIFactory());
  lightApp.paint();

  // Case 2: Client using Dark Theme
  print('\nRendering Dark Theme:');
  UIClient darkApp = UIClient(DarkUIFactory());
  darkApp.paint();

  // 🔹 Open/Closed Principle (SOLID):
  // We can add a "BlueUIFactory" and "BlueButton/BlueCheckbox" 
  // without modifying the `Application` class at all.
}
