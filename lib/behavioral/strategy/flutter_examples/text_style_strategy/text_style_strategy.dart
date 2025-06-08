import 'package:flutter/material.dart';

/// Strategy Interface
/// 🔹 Code to an interface, not an implementation
/// This allows us to swap text-styling algorithms at runtime.
abstract class TextStyleStrategy {
  TextStyle apply(TextStyle baseStyle);
}

/// Concrete Strategy 1: Bold Text
/// 🔹 Each strategy encapsulates its own behavior
/// This follows the principle: Encapsulate what varies
class BoldTextStyle implements TextStyleStrategy {
  @override
  TextStyle apply(TextStyle baseStyle) {
    // 🔹 Encapsulates “make text bold” logic here
    return baseStyle.copyWith(fontWeight: FontWeight.bold);
  }
}

/// Concrete Strategy 2: Italic Text
/// 🔹 Encapsulates “make text italic” logic
class ItalicTextStyle implements TextStyleStrategy {
  @override
  TextStyle apply(TextStyle baseStyle) {
    return baseStyle.copyWith(fontStyle: FontStyle.italic);
  }
}

/// Concrete Strategy 3: Accent Color Text
/// 🔹 Encapsulates “color text” logic
class AccentColorTextStyle implements TextStyleStrategy {
  @override
  TextStyle apply(TextStyle baseStyle) {
    return baseStyle.copyWith(color: Colors.blueAccent);
  }
}





