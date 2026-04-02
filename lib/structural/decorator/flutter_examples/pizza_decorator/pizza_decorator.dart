// Flutter Decorator Pattern Example with UI and Clean Refactor

import 'package:flutter/material.dart';

// === Component Interface ===
// 🔹 Defines the **abstraction** for all pizza types (base or decorated).
// 🔹 All concrete pizzas and decorators must implement this interface.
// 🔹 Key Principle: High-level code depends on **abstractions**, not on details (DIP).
abstract interface class Pizza {
  String getDescription();

  double getPrice();
}

// === Concrete Component ===
// 🔹 Represents a base pizza — the core object that can be decorated.
// 🔹 Provides a default description and base price.
// 🔹 Can be passed into decorators to build a pizza dynamically.
class PizzaBase implements Pizza {
  final String description;

  const PizzaBase(this.description);

  @override
  String getDescription() {
    return description;
  }

  @override
  double getPrice() {
    return 3.0;
  }
}

// === Base Decorator ===
// 🔹 Abstract base decorator that implements the Pizza interface.
// 🔹 Uses **composition**: holds a reference (`pizza`) to another Pizza object.
//    ➤ This could be the base pizza or another decorator (i.e., nested wrapping).
// 🔹 Does not change behavior directly — simply delegates to the wrapped object.
// 🔹 Subclasses override methods to **extend behavior dynamically**.
// 🔹 Key Principle: **Open/Closed Principle**
//    ➤ We can add new features (e.g., toppings) without modifying existing code.
abstract class PizzaDecorator implements Pizza {
  final Pizza pizza; // 👈 Wrapped pizza instance (can be base or another decorator)

  const PizzaDecorator(this.pizza);
}

// === Concrete Decorator: Mushroom ===
// 🔹 Adds mushroom topping by modifying the description and increasing the price.
// 🔹 Uses composition to delegate to the wrapped Pizza object.
// 🔹 Appends description and increases price.
// 🔹 Demonstrates dynamic composition of behavior.
class Mushroom extends PizzaDecorator {
  const Mushroom(super.pizza);

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n- Mushroom';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 0.5;
  }
}


// === Concrete Decorator: Mozzarella ===
// 🔹 Extends PizzaDecorator to add "Mozzarella" topping.
class Mozzarella extends PizzaDecorator {
  const Mozzarella(super.pizza);

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n- Mozzarella';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 0.8;
  }
}

// === Concrete Decorator: Pepperoni ===
// 🔹 Adds pepperoni to the pizza, modifying description and price.
class Pepperoni extends PizzaDecorator {
  const Pepperoni(super.pizza);

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n- Pepperoni';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 1.5;
  }
}

// === Concrete Decorator: Sauce ===
// 🔹 Adds sauce to the pizza using composition.
class Sauce extends PizzaDecorator {
  const Sauce(super.pizza);

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n- Sauce';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 0.9;
  }
}


