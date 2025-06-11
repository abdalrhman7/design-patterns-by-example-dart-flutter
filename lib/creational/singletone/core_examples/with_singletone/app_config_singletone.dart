// Singleton Class
// 🔒 Ensures a class has only one instance
// and provides a global access point to it
class AppConfig {
  // 🔹 Private static field to hold the single instance
  static final AppConfig _instance = AppConfig._internal();

  // 🔹 Private named constructor
  // No one from outside can create an instance directly
  AppConfig._internal();

  // 🔹 Public factory constructor
  // Always returns the same instance
  factory AppConfig() {
    return _instance;
  }

  // Sample configuration values
  String apiUrl = "https://api.example.com";
  String appName = "My App Name";

  void printConfig() {
    print("App Name: $appName");
    print("API URL: $apiUrl");
  }
}


