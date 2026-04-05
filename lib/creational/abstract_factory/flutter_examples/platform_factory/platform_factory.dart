import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Abstract Product 1: PlatformButton
// 🔹 Code to an interface, not an implementation
// Each theme family will implement its own button
abstract class PlatformButton {
  Widget build(BuildContext context, {required VoidCallback onPressed, required String text});
}

// Abstract Product 2: PlatformCheckbox
// 🔹 Code to an interface, not an implementation
abstract class PlatformCheckbox {
  Widget build(BuildContext context, {required bool value, required ValueChanged<bool?> onChanged});
}

// === Material (Android) Theme Concrete Products ===

// 🔹 Material implementation of the Button
class MaterialButtonWidget implements PlatformButton {
  @override
  Widget build(BuildContext context, {required VoidCallback onPressed, required String text}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// 🔹 Material implementation of the Checkbox
class MaterialCheckboxWidget implements PlatformCheckbox {
  @override
  Widget build(BuildContext context, {required bool value, required ValueChanged<bool?> onChanged}) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
    );
  }
}

// === Cupertino (iOS) Theme Concrete Products ===

// 🔹 Cupertino implementation of the Button
// 🔹 User request: Name changed from CupertinoButtonImpl
class CupertinoButtonWidget implements PlatformButton {
  @override
  Widget build(BuildContext context, {required VoidCallback onPressed, required String text}) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// 🔹 Cupertino implementation of the Checkbox
class CupertinoCheckboxWidget implements PlatformCheckbox {
  @override
  Widget build(BuildContext context, {required bool value, required ValueChanged<bool?> onChanged}) {
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
  PlatformButton createButton();
  PlatformCheckbox createCheckbox();
}

// Concrete Factory 1: Material Widgets Factory
// 🔹 Encapsulates the creation of Material-themed products
// This follows the principle: Encapsulate what varies
class MaterialWidgetsFactory implements UIWidgetsFactory {
  @override
  PlatformButton createButton() => MaterialButtonWidget();

  @override
  PlatformCheckbox createCheckbox() => MaterialCheckboxWidget();
}

// Concrete Factory 2: Cupertino Widgets Factory
// 🔹 Encapsulates the creation of Cupertino-themed products
class CupertinoWidgetsFactory implements UIWidgetsFactory {
  @override
  PlatformButton createButton() => CupertinoButtonWidget();

  @override
  PlatformCheckbox createCheckbox() => CupertinoCheckboxWidget();
}
