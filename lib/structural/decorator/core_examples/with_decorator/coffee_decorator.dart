// === Component Interface ===
// 🔹 This defines the **abstract interface** for all types of coffee (simple or decorated).
// 🔹 Key Principle: High-level code depends on **abstractions**, not on concrete implementations (DIP).
// 🔹 All decorators and concrete coffees must implement this interface.
abstract class Coffee {
  String getDescription();

  double getCost();
}

// === Concrete Component ===
// 🔹 This is a basic coffee type — the "core" object that can be decorated.
// 🔹 Provides the default behavior for description and cost.
class SimpleCoffee implements Coffee {
  @override
  String getDescription() {
    return 'Simple Coffee';
  }

  @override
  double getCost() {
    return 5.0;
  }
}

class Espresso implements Coffee {
  @override
  String getDescription() {
    return 'espresso';
  }

  @override
  double getCost() {
    return 7.0;
  }
}

// === Base Decorator ===
// 🔹 This is the **abstract base decorator**, which also implements the Coffee interface.
// 🔹 It uses **composition**: holds a reference (`coffee`) to another Coffee object.
//    ➤ This object could be either a SimpleCoffee (base) or another decorator (nested).
// 🔹 It does NOT modify behavior directly — it delegates work to the wrapped object.
// 🔹 Concrete decorators (like Milk, Sugar) will extend this class to **wrap** functionality around it.
// 🔹 Key Design Principle: **Open/Closed Principle**
//    ➤ We can add new features (decorators) without modifying existing code.
abstract class CoffeeDecorator extends Coffee {
  final Coffee coffee; // 👈 Holds a reference to the wrapped Coffee object

  // Inject the object to decorate (can be base or another decorator)
  CoffeeDecorator(this.coffee);
}


// === Concrete Decorator: Milk ===
// 🔹 Extends CoffeeDecorator to add milk behavior dynamically.
// 🔹 It does this by wrapping another Coffee object and adding to its behavior.
// 🔹 `coffee.getDescription()` calls the wrapped object's description (could be base or another decorator).
//    ➤ This is the essence of **chaining** decorators: each one wraps the result of the previous.
// 🔹 This demonstrates **Behavioral Extension without modifying the original Coffee classes**.
class MilkDecorator extends CoffeeDecorator {
  MilkDecorator(super.coffee);

  @override
  String getDescription() {
    // ⬇ Add "Milk" to the description returned by the wrapped coffee object
    return '${coffee.getDescription()}, Milk';
  }

  @override
  double getCost() {
    // ⬇ Add the cost of milk to the base cost
    return coffee.getCost() + 1.5;
  }
}


// === Concrete Decorator: Sugar ===
// 🔹 Another example of extending the base coffee by adding sugar.
// 🔹 It does this by wrapping another Coffee object and adding to its behavior.
// 🔹 `coffee.getDescription()` calls the wrapped object's description (could be base or another decorator).
//    ➤ This is the essence of **chaining** decorators: each one wraps the result of the previous.
// 🔹 This demonstrates **Behavioral Extension without modifying the original Coffee classes**.
class SugarDecorator extends CoffeeDecorator {
  SugarDecorator(super.coffee);

  @override
  String getDescription() {
    return '${coffee.getDescription()}, Sugar';
  }

  @override
  double getCost() {
    return coffee.getCost() + 0.5;
  }
}
