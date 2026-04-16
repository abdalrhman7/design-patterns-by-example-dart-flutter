// Subsystem 1: Lights
class Lights {
  void on() => print('Lights are ON');
  void off() => print('Lights are OFF');
  void setBrightness(int level) => print('Setting lights brightness to $level%');
}

// Subsystem 2: TV
class TV {
  void on() => print('TV is ON');
  void off() => print('TV is OFF');
  void setSource(String source) => print('TV source set to $source');
}

// Subsystem 3: Sound System
class SoundSystem {
  void on() => print('Sound System is ON');
  void off() => print('Sound System is OFF');
  void setVolume(int level) => print('Sound System volume set to $level');
}

// Subsystem 4: Air Conditioner
class AirConditioner {
  void on() => print('Air Conditioner is ON');
  void off() => print('Air Conditioner is OFF');
  void setTemperature(int temp) => print('Air Conditioner temp set to $temp°C');
}

// Client Class: Facing the complexity directly
class SmartHomeClient {
  final Lights lights = Lights();
  final TV tv = TV();
  final SoundSystem soundSystem = SoundSystem();
  final AirConditioner ac = AirConditioner();

  void watchMovie() {
    print('--- 🎬 Preparing to watch a movie ---');
    
    // 🔹 Problem 1: Hardcoded coordination logic
    // The client is responsible for knowing the exact order and methods of all subsystems.
    // If we want to "Watch Movie" from a different place, we have to duplicate this logic.
    lights.on();
    lights.setBrightness(20);
    tv.on();
    tv.setSource('Netflix');
    soundSystem.on();
    soundSystem.setVolume(30);
    ac.on();
    ac.setTemperature(22);
    
    // 🔹 Problem 2: Violates Single Responsibility Principle (SRP)
    // This class is doing two things: its business logic AND managing low-level hardware.
    
    // 🔹 Problem 3: Tight Coupling
    // The client depends on 4 different concrete classes. 
    // If any of these classes change their API (e.g., TV.on() becomes TV.power(true)),
    // we must fix the client.
    
    // 🔹 Problem 4: Hard to test and maintain
    // Testing the "Watch Movie" feature requires mocking every single subsystem.
  }

  void stopMovie() {
    print('--- 🛑 Stopping the movie ---');
    lights.setBrightness(100);
    tv.off();
    soundSystem.off();
    ac.setTemperature(25);
  }
}
