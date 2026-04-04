// —— The “Product” hierarchy ——

// Abstract Product: defines the interface all concrete products must implement.
// 🔹 Promotes polymorphism: client code can work with Pizza without knowing exact subclasses.
// 🔹 Single Responsibility: this class defines common behavior like bake, cut, and box.
abstract class Pizza {
  String name;

  Pizza(this.name);

  // Custom step for each pizza — must be overridden by subclasses.
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

// — Concrete Products —
// 🔹 Open/Closed Principle: new pizza types can be added without changing existing code.
class CheesePizza extends Pizza {
  CheesePizza() : super('Cheese Pizza');

  @override
  void prepare() {
    print('Preparing $name:');
    print('- Tossing dough');
    print('- Adding tomato sauce');
    print('- Adding shredded mozzarella');
  }
}

class VeggiePizza extends Pizza {
  VeggiePizza() : super('Veggie Pizza');

  @override
  void prepare() {
    print('Preparing $name:');
    print('- Tossing dough');
    print('- Adding pesto sauce');
    print('- Adding bell peppers, olives, onions');
  }
}

// —— The Creator — PizzaStore ——

// Abstract Creator: declares the factory method createPizza()
// 🔹 Factory Method Pattern: defines an interface for creating an object, but lets subclasses decide which class to instantiate.
// 🔹 Key Idea: PizzaStore delegates the creation of specific pizzas to its subclasses by calling createPizza().
// 🔹 Benefit: separates the stable ordering steps from the changeable object creation.
// 🔹 Extensible: to add a new pizza type, you only modify or extend specific PizzaStore subclasses—not the abstract PizzaStore itself.

abstract class PizzaStore {
  // Factory Method — must be implemented by subclasses to decide which concrete Pizza to create.
  Pizza createPizza(String type);

  // 🔹 High-level workflow: defines the fixed steps for ordering any pizza.
  // 🔹 Doesn’t depend on specific pizza types — it relies on the abstract Pizza interface.
  // 🔹 Uses the factory method (createPizza) to delegate object creation to subclasses.
  // 🔹 This promotes Dependency Inversion: high-level logic depends on abstractions, not concrete classes.

  Pizza orderPizza(String type) {
    final pizza = createPizza(type); // Factory Method in action

    // Common steps shared across all pizza types and stores
    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();

    return pizza;
  }
}

// —— Concrete Creators — NY & Chicago ——

// 🔹 Each store customizes the product instantiation logic, not the whole process.
class NYPizzaStore extends PizzaStore {
  @override
  Pizza createPizza(String type) {
    if (type == 'cheese') {
      print('— Making a New York–style Cheese Pizza');
      return CheesePizza();
    } else if (type == 'veggie') {
      print('— Making a New York–style Veggie Pizza');
      return VeggiePizza();
    } else {
      throw UnsupportedError('Unknown pizza type: $type');
    }
  }
}

class ChicagoPizzaStore extends PizzaStore {
  @override
  Pizza createPizza(String type) {
    if (type == 'cheese') {
      print('— Making a Chicago–style Deep Dish Cheese Pizza');
      return CheesePizza(); // Could be a ChicagoCheesePizza subclass
    } else if (type == 'veggie') {
      print('— Making a Chicago–style Veggie Pizza');
      return VeggiePizza(); // Could be a ChicagoVeggiePizza subclass
    } else {
      throw UnsupportedError('Unknown pizza type: $type');
    }
  }
}

