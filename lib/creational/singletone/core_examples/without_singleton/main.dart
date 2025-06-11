import 'app_config_without_singleton.dart';

void main() {
  // 🔁 Create two separate instances
  var config1 = AppConfig();
  var config2 = AppConfig();

  config1.printConfig();
  print("------");

  // 🧪 Modify the first instance
  config1.apiUrl = "https://api.changed.com";
  config1.appName = "My New App Name";

  // ❗ config2 is not affected because it's a separate object
  config2.printConfig();

  print("Same instance? ${identical(config1, config2)}"); // false
}
