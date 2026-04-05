// UI Without Abstract Factory Pattern
// This class demonstrates the problems when creating families of related objects
// without using the Abstract Factory Pattern

class LightButton {
  void render() => print('Rendering Light Button');
}

class LightCheckbox {
  void render() => print('Rendering Light Checkbox');
}

class DarkButton {
  void render() => print('Rendering Dark Button');
}

class DarkCheckbox {
  void render() => print('Rendering Dark Checkbox');
}

class UIClient {
  void renderUI(String theme) {
    // 🔹 Problem 1: Hardcoded object instantiation
    // The Application class is tightly coupled to concrete classes like LightButton and DarkButton.
    // If we want to support a new theme (e.g., Blue Theme), we have to modify the Application class.
    
    // 🔹 Problem 2: Violates Open/Closed Principle (OCP)
    // Adding a new set of related objects requires changing the logic here.
    
    // 🔹 Problem 3: No guarantee of consistency
    // Nothing prevents us from accidentally mixing a LightButton with a DarkCheckbox,
    // leading to an inconsistent UI.
    
    if (theme == 'light') {
      LightButton().render();
      LightCheckbox().render();
    } else if (theme == 'dark') {
      DarkButton().render();
      DarkCheckbox().render();
    } else {
      print('Theme not supported');
    }
    
    // 🔹 Any change to UI logic forces changes in this class,
    // making the code less maintainable and harder to test.
  }
}
