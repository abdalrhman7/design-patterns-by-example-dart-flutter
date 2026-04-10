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

// Abstract Product 3: PlatformIndicator
abstract class PlatformIndicator extends StatelessWidget {
  const PlatformIndicator({super.key});
}

// Abstract Product 4: PlatformSlider
abstract class PlatformSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const PlatformSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });
}

// Abstract Product 5: PlatformSegmentedControl
abstract class PlatformSegmentedControl extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String> onSelected;

  const PlatformSegmentedControl({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onSelected,
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

class MaterialIndicatorWidget extends PlatformIndicator {
  const MaterialIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class MaterialSliderWidget extends PlatformSlider {
  const MaterialSliderWidget({
    super.key,
    required super.value,
    required super.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: onChanged,
    );
  }
}

class MaterialSegmentedControlWidget extends PlatformSegmentedControl {
  const MaterialSegmentedControlWidget({
    super.key,
    required super.options,
    required super.selectedOption,
    required super.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      segments: options
          .map((opt) => ButtonSegment<String>(value: opt, label: Text(opt)))
          .toList(),
      selected: {selectedOption},
      onSelectionChanged: (Set<String> selection) {
        onSelected(selection.first);
      },
      multiSelectionEnabled: false,
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

class CupertinoIndicatorWidget extends PlatformIndicator {
  const CupertinoIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator();
  }
}

class CupertinoSliderWidget extends PlatformSlider {
  const CupertinoSliderWidget({
    super.key,
    required super.value,
    required super.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSlider(
      value: value,
      onChanged: onChanged,
    );
  }
}

class CupertinoSegmentedControlWidget extends PlatformSegmentedControl {
  const CupertinoSegmentedControlWidget({
    super.key,
    required super.options,
    required super.selectedOption,
    required super.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSegmentedControl<String>(
      children: {
        for (var opt in options) opt: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(opt),
        ),
      },
      groupValue: selectedOption,
      onValueChanged: onSelected,
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
  PlatformIndicator createIndicator();
  PlatformSlider createSlider({required double value, required ValueChanged<double> onChanged});
  PlatformSegmentedControl createSegmentedControl({
    required List<String> options,
    required String selectedOption,
    required ValueChanged<String> onSelected,
  });
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

  @override
  PlatformIndicator createIndicator() => const MaterialIndicatorWidget();

  @override
  PlatformSlider createSlider({required double value, required ValueChanged<double> onChanged}) {
    return MaterialSliderWidget(value: value, onChanged: onChanged);
  }

  @override
  PlatformSegmentedControl createSegmentedControl({
    required List<String> options,
    required String selectedOption,
    required ValueChanged<String> onSelected,
  }) {
    return MaterialSegmentedControlWidget(
      options: options,
      selectedOption: selectedOption,
      onSelected: onSelected,
    );
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

  @override
  PlatformIndicator createIndicator() => const CupertinoIndicatorWidget();

  @override
  PlatformSlider createSlider({required double value, required ValueChanged<double> onChanged}) {
    return CupertinoSliderWidget(value: value, onChanged: onChanged);
  }

  @override
  PlatformSegmentedControl createSegmentedControl({
    required List<String> options,
    required String selectedOption,
    required ValueChanged<String> onSelected,
  }) {
    return CupertinoSegmentedControlWidget(
      options: options,
      selectedOption: selectedOption,
      onSelected: onSelected,
    );
  }
}
