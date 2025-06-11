# 🎨 Decorator Pattern

## 🧠 Definition


The Decorator design pattern is a structural pattern that allows you to dynamically add or modify the behavior of an object without altering its structure. It achieves this by wrapping the object in a "decorator" class that adds extra functionalities. This pattern prioritizes composition over inheritance and allows you to add features without modifying the base object's code.

### 🔑 Key aspects of the Decorator pattern:

- **Dynamic behavior addition**:  
  Decorators allow you to add new functionalities to objects at runtime, making it easy to extend or modify their behavior without changing their core structure.

- **Composition over inheritance**:  
  Instead of using inheritance, Decorator relies on wrapping the object within a decorator class, adding new features without modifying the original class.

- **Flexibility and modularity**:  
  The pattern promotes a flexible and modular approach to adding functionalities, allowing you to combine different decorators to create various combinations of behaviors.

- **Open-Closed Principle**:  
  It adheres to the Open-Closed Principle by allowing the extension of object behavior without modifying the base class.


---

## 🚀 When to Use

* When you need to add features to individual objects dynamically and transparently without affecting other objects.
* When subclassing leads to a large number of classes for every possible feature combination.
* When you want to apply multiple optional behaviors in a flexible way.
* When wrapping UI widgets or modifying behavior in frameworks like Flutter, where nesting widgets is a form of decoration.

---

## 🧱 Structure

**Component (interface or abstract class)**
↳ Defines the contract for the object that can be decorated.

**ConcreteComponent**
↳ The core object whose behavior can be extended.

**Decorator (abstract class)**
↳ Implements the Component interface and holds a reference to a Component. Delegates work to the component while adding its own behavior.

**ConcreteDecorator**
↳ Adds new functionality before or after delegating to the wrapped component.

```
Client → ConcreteComponent → Decorator → Decorator → ...
```

---

## ✅ Key Principles in Action

### 🔹 1. **Composition Over Inheritance**

Rather than creating multiple subclasses for every combination of behavior, we compose new behavior by wrapping components.

### 🔹 2. **Open/Closed Principle**

You can add new decorators to extend functionality without modifying existing code — just wrap the component.

### 🔹 3. **Single Responsibility**

Each decorator class has one responsibility: adding one specific feature. This keeps classes focused and easy to maintain.

### 🔹 4. **Layered Enhancements**

Decorators can be stacked in any order, and each one adds something on top of the others — just like layering pizza toppings or nesting widgets in Flutter.

---

## 🧱 SOLID Principles Applied

| Principle                     | Description                                                                                |
| ----------------------------- | ------------------------------------------------------------------------------------------ |
| **S** - Single Responsibility | Each decorator adds only one feature, keeping logic focused and manageable.                |
| **O** - Open/Closed           | You can create new decorators without changing the base or existing ones.                  |
| **L** - Liskov Substitution   | All decorators and base components implement the same interface — they’re interchangeable. |
| **D** - Dependency Inversion  | High-level modules depend on abstraction (Component), not on concrete implementations.     |

---

## 📁 Project Structure

* `core_examples/` → Simple Dart examples showing how decorators wrap and extend behavior.
* `flutter_examples/` → Flutter UI examples showing how widgets are decorated dynamically.
* `without_pattern/` → Example without decorators: tightly coupled and less flexible.
* `with_decorator/` → Refactored version using the Decorator Pattern cleanly.

---

## 🎯 Real-World Analogy

Think of decorating a plain pizza 🍕:

* Start with a `PizzaBase`.
* Wrap it with `Sauce`, `Mozzarella`, `Basil`, etc.
* Each topping adds its own flavor and cost.
* You can change the order, remove a topping, or add new ones — all without touching the original pizza class.

---

## 🧰 Flutter Insight

In Flutter, **every time you wrap a widget with another widget** (like `Padding`, `Center`, `Container`, etc.), you're essentially using the Decorator Pattern. Each wrapper adds behavior or style without changing the core widget.

```text
Container(
  padding: EdgeInsets.all(16),
  child: Center(
    child: Text("Hello"),
  ),
)
```

⬆️ This is just like:

```text
PizzaBase() → Sauce() → Cheese() → Basil()
```

---

## 📌 Summary

The Decorator Pattern is all about flexible, runtime-based extension of object behavior. It helps avoid bloated inheritance trees and makes your code more modular and reusable. Especially in UI frameworks like Flutter, this pattern is used daily — often without even realizing it.

It’s a powerful tool for clean, maintainable code — one slice at a time 🍕.
