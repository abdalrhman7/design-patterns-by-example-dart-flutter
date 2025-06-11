// ❌ No Singleton - Every time we create a new instance

class AppConfig {
  // 👇 Normal public constructor (not private)
  AppConfig();

  // Sample configuration values
  String apiUrl = "https://api.example.com";
  String appName = "My App Name";

  void printConfig() {
    print("App Name: $appName");
    print("API URL: $apiUrl");
  }
}

