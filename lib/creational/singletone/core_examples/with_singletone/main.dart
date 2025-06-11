import 'app_config_singletone.dart';

void main() {
  // 🧪 Try to create multiple instances
  var config1 = AppConfig();
  var config2 = AppConfig();

  config1.printConfig();
  print("------");

  // 🧪 Modify the instance
  config1.apiUrl = "https://api.changed.com";

  // 🧪 Verify both point to the same instance
  config2.printConfig(); // Will show the changed URL

  print("Same instance? ${identical(config1, config2)}"); // true

  print("------");

  // modify config2 instance
  config2.appName = "My New App Name";
  config2.apiUrl = "https://api.changed.com";

  // verify both point to the same instance
  config1.printConfig(); // Will show the changed URL and name
}