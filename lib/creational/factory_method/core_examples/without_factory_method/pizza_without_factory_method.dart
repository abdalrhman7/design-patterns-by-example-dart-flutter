// 🚫 Bad Example: Pizza Ordering Without Factory Method
// This version shows how things can go wrong if you don’t use the Factory Method pattern.
// It tightly couples the client code to concrete classes, making it harder to scale or modify.

// 🍕 Pizza classes are still okay — same as before
abstract class Pizza {
  String name;
  Pizza(this.name);

  void prepare();

  void bake() {
    print('Baking $name at 350°F for 25 minutes');
  }

  void cut() {
    print('Cutting $name into diagonal slices');
  }

  void box() {
    print('Placing $name in official PizzaStore box');
  }

  @override
  String toString() => name;
}

class CheesePizza extends Pizza {
  CheesePizza() : super('Cheese Pizza');

  @override
  void prepare() {
    print('Preparing $name with tomato sauce and mozzarella');
  }
}

class VeggiePizza extends Pizza {
  VeggiePizza() : super('Veggie Pizza');

  @override
  void prepare() {
    print('Preparing $name with pesto and vegetables');
  }
}

// ❌ A store that violates the Factory Method pattern
class BadPizzaStore {
  // 👎 This method is bloated with creation logic.
  // 👎 Violates SRP: this method does both creating and preparing.
  // 👎 Violates OCP: if we want to add new pizza types, we must edit this method.
  // 👎 Violates DIP: the method depends on concrete Pizza classes.

  Pizza orderPizza(String type) {
    late Pizza pizza;

    // Hardcoded creation logic — tightly coupled
    if (type == 'cheese') {
      pizza = CheesePizza();
    } else if (type == 'veggie') {
      pizza = VeggiePizza();
    } else {
      throw UnsupportedError('Unknown pizza type: $type');
    }

    // Fixed steps
    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();

    return pizza;
  }
}

