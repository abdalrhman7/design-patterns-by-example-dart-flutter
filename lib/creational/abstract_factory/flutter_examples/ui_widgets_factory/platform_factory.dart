import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Abstract Product 1: BrandButton
// 🔹 Code to an interface, not an implementation
// Each theme family will implement its own button
abstract class BrandButton {
  Widget build(BuildContext context, {required VoidCallback onPressed, required String text});
}

// Abstract Product 2: BrandCheckbox
// 🔹 Code to an interface, not an implementation
abstract class BrandCheckbox {
  Widget build(BuildContext context, {required bool value, required ValueChanged<bool?> onChanged});
}

// === Material (Android) Theme Concrete Products ===

// 🔹 Material implementation of the Button
class MaterialButton implements BrandButton {
  @override
  Widget build(BuildContext context, {required VoidCallback onPressed, required String text}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// 🔹 Material implementation of the Checkbox
class MaterialCheckbox implements BrandCheckbox {
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
class CupertinoButtonImpl implements BrandButton {
  @override
  Widget build(BuildContext context, {required VoidCallback onPressed, required String text}) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// 🔹 Cupertino implementation of the Checkbox
// Note: Cupertino doesn't have a built-in checkbox, so we mock it with a Switch
class CupertinoCheckboxImpl implements BrandCheckbox {
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
  BrandButton createButton();
  BrandCheckbox createCheckbox();
}

// Concrete Factory 1: Material Widgets Factory
// 🔹 Encapsulates the creation of Material-themed products
// This follows the principle: Encapsulate what varies
class MaterialWidgetsFactory implements UIWidgetsFactory {
  @override
  BrandButton createButton() => MaterialButton();

  @override
  BrandCheckbox createCheckbox() => MaterialCheckbox();
}

// Concrete Factory 2: Cupertino Widgets Factory
// 🔹 Encapsulates the creation of Cupertino-themed products
class CupertinoWidgetsFactory implements UIWidgetsFactory {
  @override
  BrandButton createButton() => CupertinoButtonImpl();

  @override
  BrandCheckbox createCheckbox() => CupertinoCheckboxImpl();
}
