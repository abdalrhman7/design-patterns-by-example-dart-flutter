/// Target interface expected by the phone.
/// The phone only knows USB-C style charging.
abstract class UsbCPort {
  String providePowerUsbC();
}

/// Client: modern phone that depends on UsbCPort.
class ModernPhone {
  int batteryPercent = 20;

  String charge(UsbCPort port) {
    final result = port.providePowerUsbC();
    if (result.startsWith('OK')) {
      batteryPercent = (batteryPercent + 30).clamp(0, 100);
    }
    return result;
  }
}

/// Adaptee: old wall charger with incompatible interface (USB-A).
class OldUsbACharger {
  String providePowerUsbA() {
    return 'USB-A power is available';
  }
}

/// Adapter: converts USB-A charger behavior to UsbCPort.
/// Delegation: adapter forwards to OldUsbACharger after translation.
class UsbAToUsbCAdapter implements UsbCPort {
  final OldUsbACharger _oldCharger;

  UsbAToUsbCAdapter(this._oldCharger);

  @override
  String providePowerUsbC() {
    final raw = _oldCharger.providePowerUsbA();
    return 'OK: adapted ($raw) -> USB-C output';
  }
}
