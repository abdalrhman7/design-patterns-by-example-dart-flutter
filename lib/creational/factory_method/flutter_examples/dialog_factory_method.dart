import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// —— Abstract Product ——

// CustomDialog defines the interface for all concrete dialogs.
// 🔹 Promotes Polymorphism: Client code uses CustomDialog without knowing exact subclass.
// 🔹 Supports DIP (Dependency Inversion Principle): high-level modules depend on abstractions.
abstract class CustomDialog {
  Future<void> show(BuildContext context);
}

// —— Concrete Product: AndroidAlertDialog ——

// A concrete implementation of CustomDialog for Android alert dialogs.
// 🔹 Open/Closed Principle: new dialog types can be added without modifying existing logic.
// 🔹 Encapsulates Android-specific UI details.
class AndroidAlertDialog implements CustomDialog {
  @override
  Future<void> show(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Android Alert"),
        content: const Text("This is an Android style dialog."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Close"),
          )
        ],
      ),
    );
  }
}

// —— Concrete Product: AndroidConfirmDialog ——

// A concrete implementation of CustomDialog for Android confirmation dialogs.
// 🔹 Keeps Android-specific logic encapsulated.
// 🔹 Easily swappable due to adherence to the CustomDialog interface.
class AndroidConfirmDialog implements CustomDialog {
  @override
  Future<void> show(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Android Confirm"),
        content: const Text("Do you want to proceed?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }
}

// —— Concrete Product: IosAlertDialog ——

// A concrete implementation of CustomDialog for iOS alert dialogs.
// 🔹 Same interface as Android versions, which supports interchangeability.
class IosAlertDialog implements CustomDialog {
  @override
  Future<void> show(BuildContext context) async {
    return showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text("iOS Alert"),
        content: const Text("This is a Cupertino style dialog."),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Close"),
          )
        ],
      ),
    );
  }
}

// —— Concrete Product: IosConfirmDialog ——

// A concrete implementation of CustomDialog for iOS confirmation dialogs.
// 🔹 Easy to substitute and extend due to shared interface.
class IosConfirmDialog implements CustomDialog {
  @override
  Future<void> show(BuildContext context) async {
    return showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text("iOS Confirm"),
        content: const Text("Do you want to continue?"),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("No"),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }
}

// —— Creator — DialogManager ——

// Declares the Factory Method: createDialog()
// 🔹 Factory Method Pattern: lets subclasses decide which concrete dialog to instantiate.
// 🔹 Delegates the creation of dialogs to subclasses (Factory Method Pattern).
// 🔹 showDialog() remains unchanged (Open/Closed Principle).
// 🔹 High-level module depends only on abstraction (DIP).
abstract class DialogManager {
  CustomDialog createDialog(String type); //  Factory Method

  // Stable logic — delegates creation to the subclass
  Future<void> showDialog(BuildContext context, String type) {
    final dialog = createDialog(type); //  Decision made by subclass
    return dialog.show(context);
  }
}

// —— Concrete Creator: AndroidDialogManager ——

// Implements the factory method to create Android-style dialogs.
// 🔹 Open/Closed Principle: can add more dialog types without affecting other classes.

class AndroidDialogManager extends DialogManager {
  @override
  CustomDialog createDialog(String type) {
    if (type == 'alert') {
      return AndroidAlertDialog();
    } else if (type == 'confirm') {
      return AndroidConfirmDialog();
    }
    throw UnsupportedError('Unknown dialog type: $type');
  }
}

// —— Concrete Creator: IosDialogManager ——

// Implements the factory method to create iOS-style dialogs.
// 🔹 Open/Closed Principle: can add more dialog types without affecting other classes.

class IosDialogManager extends DialogManager {
  @override
  CustomDialog createDialog(String type) {
    if (type == 'alert') {
      return IosAlertDialog();
    } else if (type == 'confirm') {
      return IosConfirmDialog();
    }
    throw UnsupportedError('Unknown dialog type: $type');
  }
}
