import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Abstract Product 1: PlatformButton
// 🔹 Code to an interface, not an implementation
// Each theme family will implement its own button
abstract class PlatformButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const PlatformButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
}

// Abstract Product 2: PlatformCheckbox
// 🔹 Code to an interface, not an implementation
abstract class PlatformCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const PlatformCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });
}

// === Material (Android) Theme Concrete Products ===

// 🔹 Material implementation of the Button
// 🔹 Each product encapsulates its own behavior
class MaterialButtonWidget extends PlatformButton {
  const MaterialButtonWidget({
    super.key,
    required super.onPressed,
    required super.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// 🔹 Material implementation of the Checkbox
class MaterialCheckboxWidget extends PlatformCheckbox {
  const MaterialCheckboxWidget({
    super.key,
    required super.value,
    required super.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
    );
  }
}

// === Cupertino (iOS) Theme Concrete Products ===

// 🔹 Cupertino implementation of the Button
class CupertinoButtonWidget extends PlatformButton {
  const CupertinoButtonWidget({
    super.key,
    required super.onPressed,
    required super.text,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// 🔹 Cupertino implementation of the Checkbox
class CupertinoCheckboxWidget extends PlatformCheckbox {
  const CupertinoCheckboxWidget({
    super.key,
    required super.value,
    required super.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: (v) => onChanged(v),
    );
  }
}

// -------------------------------------------------------------

// Abstract Factory: Widgets Factory
// 🔹 Interface for creating families of related products
// This ensures that products created by a factory are compatible with each other.
abstract class UIWidgetsFactory {
  PlatformButton createButton({required VoidCallback onPressed, required String text});
  PlatformCheckbox createCheckbox({required bool value, required ValueChanged<bool?> onChanged});
}

// Concrete Factory 1: Material Widgets Factory
// 🔹 Encapsulates the creation of Material-themed products
// This follows the principle: Encapsulate what varies
class MaterialWidgetsFactory implements UIWidgetsFactory {
  @override
  PlatformButton createButton({required VoidCallback onPressed, required String text}) {
    return MaterialButtonWidget(onPressed: onPressed, text: text);
  }

  @override
  PlatformCheckbox createCheckbox({required bool value, required ValueChanged<bool?> onChanged}) {
    return MaterialCheckboxWidget(value: value, onChanged: onChanged);
  }
}

// Concrete Factory 2: Cupertino Widgets Factory
// 🔹 Encapsulates the creation of Cupertino-themed products
class CupertinoWidgetsFactory implements UIWidgetsFactory {
  @override
  PlatformButton createButton({required VoidCallback onPressed, required String text}) {
    return CupertinoButtonWidget(onPressed: onPressed, text: text);
  }

  @override
  PlatformCheckbox createCheckbox({required bool value, required ValueChanged<bool?> onChanged}) {
    return CupertinoCheckboxWidget(value: value, onChanged: onChanged);
  }
}
