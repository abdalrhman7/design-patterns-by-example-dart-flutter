
import 'button_checkbox_without_factory.dart';

// === Usage Without Abstract Factory Pattern ===
void main() {
  print('--- UI Rendering WITHOUT Abstract Factory ---');

  final app = UIClient();

  print('\nRendering Light Theme:');
  app.renderUI('light');

  print('\nRendering Dark Theme:');
  app.renderUI('dark');

  // What if we want to add a "BlueTheme" later?
  // We’ll need to create new BlueButton and BlueCheckbox classes,
  // and THEN modify the `renderUI()` method in the `Application` class.
}
