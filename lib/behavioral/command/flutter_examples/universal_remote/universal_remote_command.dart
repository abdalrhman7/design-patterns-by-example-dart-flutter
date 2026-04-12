/// Command interface — every remote button (or macro) implements this.
// 🔹 Code to an interface: the invoker only calls [execute], not device APIs.
abstract class RemoteCommand {
  void execute();
}

// --- Receivers (each device owns its own state & rules) ---

/// TV: power and channel.
// 🔹 Separation of concerns: channel logic stays here, not in widgets or invoker.
class TvReceiver {
  bool _on = false;
  int _channel = 1;

  bool get isOn => _on;
  int get channel => _channel;

  void powerOn() {
    _on = true;
  }

  void powerOff() {
    _on = false;
  }

  void channelUp() {
    if (!_on) return;
    _channel = _channel >= 99 ? 1 : _channel + 1;
  }

  void channelDown() {
    if (!_on) return;
    _channel = _channel <= 1 ? 99 : _channel - 1;
  }
}

/// Fan: speed 0 (off) .. 3 (high).
class FanReceiver {
  int _speed = 0;

  int get speed => _speed;

  void speedUp() {
    _speed = (_speed + 1).clamp(0, 3);
  }

  void speedDown() {
    _speed = (_speed - 1).clamp(0, 3);
  }

  void setSpeed(int value) {
    _speed = value.clamp(0, 3);
  }
}

/// Room lights: brightness 0 .. 100.
class LightsReceiver {
  int _brightness = 50;

  int get brightness => _brightness;

  void brighter() {
    _brightness = (_brightness + 20).clamp(0, 100);
  }

  void dimmer() {
    _brightness = (_brightness - 20).clamp(0, 100);
  }

  void setBrightness(int value) {
    _brightness = value.clamp(0, 100);
  }
}

// --- Concrete commands (one class per remote action) ---

class TvPowerOnCommand implements RemoteCommand {
  final TvReceiver _tv;
  TvPowerOnCommand(this._tv);
  @override
  void execute() => _tv.powerOn();
}

class TvPowerOffCommand implements RemoteCommand {
  final TvReceiver _tv;
  TvPowerOffCommand(this._tv);
  @override
  void execute() => _tv.powerOff();
}

class TvChannelUpCommand implements RemoteCommand {
  final TvReceiver _tv;
  TvChannelUpCommand(this._tv);
  @override
  void execute() => _tv.channelUp();
}

class TvChannelDownCommand implements RemoteCommand {
  final TvReceiver _tv;
  TvChannelDownCommand(this._tv);
  @override
  void execute() => _tv.channelDown();
}

class FanSpeedUpCommand implements RemoteCommand {
  final FanReceiver _fan;
  FanSpeedUpCommand(this._fan);
  @override
  void execute() => _fan.speedUp();
}

class FanSpeedDownCommand implements RemoteCommand {
  final FanReceiver _fan;
  FanSpeedDownCommand(this._fan);
  @override
  void execute() => _fan.speedDown();
}

/// Used by macros (and could be bound to a custom slot on a real remote).
class FanSetSpeedCommand implements RemoteCommand {
  final FanReceiver _fan;
  final int _speed;
  FanSetSpeedCommand(this._fan, this._speed);
  @override
  void execute() => _fan.setSpeed(_speed);
}

class LightsBrighterCommand implements RemoteCommand {
  final LightsReceiver _lights;
  LightsBrighterCommand(this._lights);
  @override
  void execute() => _lights.brighter();
}

class LightsDimmerCommand implements RemoteCommand {
  final LightsReceiver _lights;
  LightsDimmerCommand(this._lights);
  @override
  void execute() => _lights.dimmer();
}

class LightsSetBrightnessCommand implements RemoteCommand {
  final LightsReceiver _lights;
  final int _level;
  LightsSetBrightnessCommand(this._lights, this._level);
  @override
  void execute() => _lights.setBrightness(_level);
}

/// Runs several commands in order — one “macro” button, many encapsulated steps.
// 🔹 Open/Closed: add new scenes by composing existing commands without changing invoker code.
class MacroCommand implements RemoteCommand {
  final List<RemoteCommand> _steps;

  MacroCommand(this._steps);

  @override
  void execute() {
    for (final step in _steps) {
      step.execute();
    }
  }
}

/// Invoker: single entry for every physical/virtual button on the remote.
// 🔹 Here you could add logging, queuing, or permissions once — all buttons go through [press].
class UniversalRemoteInvoker {
  void press(RemoteCommand command) {
    command.execute();
  }
}
