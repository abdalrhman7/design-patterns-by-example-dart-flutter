// Abstract Product 1: Button
// 🔹 Code to an interface, not an implementation
// We depend on abstraction here, not a concrete class
abstract class Button {
  void render();
}

// Abstract Product 2: Checkbox
// 🔹 Code to an interface, not an implementation
abstract class Checkbox {
  void render();
}

// === Light Theme Concrete Products ===

// 🔹 Each product encapsulates its own behavior
class LightButton implements Button {
  @override
  void render() => print('Rendering Light Button');
}

class LightCheckbox implements Checkbox {
  @override
  void render() => print('Rendering Light Checkbox');
}

// === Dark Theme Concrete Products ===

class DarkButton implements Button {
  @override
  void render() => print('Rendering Dark Button');
}

class DarkCheckbox implements Checkbox {
  @override
  void render() => print('Rendering Dark Checkbox');
}

// -------------------------------------------------------------

// Abstract Factory: UI factory
// 🔹 Interface for creating families of related products
// This ensures that products created by a factory are compatible with each other.
abstract class UIFactory {
  Button createButton();
  Checkbox createCheckbox();
}

// Concrete Factory 1: Light Theme Factory
// 🔹 Encapsulates the creation of light-themed products
// This follows the principle: Encapsulate what varies
class LightUIFactory implements UIFactory {
  @override
  Button createButton() => LightButton();

  @override
  Checkbox createCheckbox() => LightCheckbox();
}

// Concrete Factory 2: Dark Theme Factory
// 🔹 Encapsulates the creation of dark-themed products
class DarkUIFactory implements UIFactory {
  @override
  Button createButton() => DarkButton();

  @override
  Checkbox createCheckbox() => DarkCheckbox();
}

// -------------------------------------------------------------

// Client: Context that uses the Factory
class UIClient {
  late Button button;
  late Checkbox checkbox;

  // 🔹 Dependency Inversion (SOLID)
  // The client depends on abstract factories and abstract products,
  // not concrete implementations.
  UIClient(UIFactory factory) {
    button = factory.createButton();
    checkbox = factory.createCheckbox();
  }

  // 🔹 Polymorphism in action:
  // We call 'render' on abstract types, and the correct
  // theme-specific implementation runs at runtime.
  void paint() {
    button.render();
    checkbox.render();
  }
}
