// === Subsystems (Complexity Hidden Behind the Facade) ===

class Lights {
  void on() => print('Lights are ON');
  void off() => print('Lights are OFF');
  void setBrightness(int level) => print('Setting lights brightness to $level%');
}

class TV {
  void on() => print('TV is ON');
  void off() => print('TV is OFF');
  void setSource(String source) => print('TV source set to $source');
}

class SoundSystem {
  void on() => print('Sound System is ON');
  void off() => print('Sound System is OFF');
  void setVolume(int level) => print('Sound System volume set to $level');
}

class AirConditioner {
  void on() => print('Air Conditioner is ON');
  void off() => print('Air Conditioner is OFF');
  void setTemperature(int temp) => print('Air Conditioner temp set to $temp°C');
}

// -------------------------------------------------------------------------

// Facade: The Simplified Interface
// 🔹 Provides a higher-level interface that makes the subsystem easier to use
class SmartHomeFacade {
  final Lights _lights = Lights();
  final TV _tv = TV();
  final SoundSystem _soundSystem = SoundSystem();
  final AirConditioner _ac = AirConditioner();

  // 🔹 Encapsulate complex coordination
  // The client no longer needs to know which devices to turn on and in what order.
  void watchMovie() {
    print('--- 🎬 Facade: Activating Movie Mode ---');
    _lights.on();
    _lights.setBrightness(20);
    _tv.on();
    _tv.setSource('Netflix');
    _soundSystem.on();
    _soundSystem.setVolume(30);
    _ac.on();
    _ac.setTemperature(22);
  }

  void stopMovie() {
    print('--- 🛑 Facade: Stopping Movie Mode ---');
    _lights.setBrightness(100);
    _tv.off();
    _soundSystem.off();
    _ac.setTemperature(25);
  }

  void goToSleep() {
    print('--- 😴 Facade: Preparing for Sleep ---');
    _lights.off();
    _tv.off();
    _soundSystem.off();
    _ac.on();
    _ac.setTemperature(24);
  }
}

// -------------------------------------------------------------------------

// Client Code
class SmartHomeClient_Refactored {
  // 🔹 Dependency Inversion (SOLID)
  // The client depends on the Facade (a simplified interface) 
  // rather than the many concrete subsystem classes.
  final SmartHomeFacade _facade = SmartHomeFacade();

  void enjoyEvening() {
    // 🔹 Simplified usage: One call instead of many
    _facade.watchMovie();
    
    // 🔹 Decoupling:
    // If we upgrade the TV to a Projector, we only change the Facade, 
    // and the client code stays exactly the same.
  }
}
