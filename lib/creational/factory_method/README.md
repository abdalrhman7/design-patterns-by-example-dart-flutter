# 🏭 Factory Method Pattern

## 🧠 Definition

The Factory Method pattern is a **creational** design pattern that provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.

This pattern decouples the code that creates objects from the code that uses them, making it easier to extend and maintain.

---

## 🚀 When to Use

* When the exact type of object to create isn’t known until runtime.
* When you want to delegate the responsibility of instantiating objects to subclasses.
* When code needs to work with products without knowing their exact classes.
* When object creation logic is complex or varies significantly across implementations.

---

## 🧱 Structure

**Product (interface or abstract class)**  
↳ Defines the interface of objects the factory method creates.

**ConcreteProduct**  
↳ Implements the Product interface.

**Creator (abstract class)**  
↳ Declares the factory method which returns Product objects. May define default behavior.

**ConcreteCreator**  
↳ Overrides the factory method to return a specific ConcreteProduct.

```
Client → Creator → (factoryMethod) → ConcreteProduct
```

---

## ✅ Key Principles in Action

### 🔹 1. **Open/Closed Principle**

You can introduce new product types by adding new subclasses without changing existing logic.

### 🔹 2. **Single Responsibility**

Each Creator class is only responsible for instantiating specific types of products.

### 🔹 3. **Dependency Inversion**

The creator depends on an abstraction (Product), not on concrete implementations.

### 🔹 4. **Encapsulation of Object Creation**

The object creation code is isolated in one place, reducing duplication and enhancing maintainability.

---

## 🧱 SOLID Principles Applied

| Principle                     | Description                                                                 |
| ----------------------------- | --------------------------------------------------------------------------- |
| **S** - Single Responsibility | Each factory class handles the creation of one family/type of products.     |
| **O** - Open/Closed           | You can add new factories or products without changing existing code.       |
| **L** - Liskov Substitution   | Clients use Product interface, so any subclass can be used interchangeably. |
| **D** - Dependency Inversion  | High-level logic depends on abstraction (Product), not concrete classes.    |

---

## 📁 Project Structure

* `core_examples/` → Pure Dart implementation with Pizza types and PizzaStore subclasses.
* `flutter_examples/` → Flutter UI examples that let users choose dialog platforms (Android/iOS) and dialog types (alert/confirm), demonstrating the Factory Method in a visual and interactive way.
* `without_pattern/` → Coupled version that directly instantiates pizza types (violates OCP).
* `with_factory_method/` → Refactored version applying Factory Method cleanly.

---

## 🧱 Before vs After

### ❌ Without Factory Method

* The `PizzaStore` class creates all pizza types directly using `if`/`else`.
* Adding a new pizza means modifying this class = violates Open/Closed Principle.
* All logic is tightly coupled and not reusable across different store types.

### ✅ With Factory Method

* Pizza creation logic is pushed to subclasses like `NYPizzaStore`, `ChicagoPizzaStore`.
* `PizzaStore` provides the general workflow and calls `createPizza()` — polymorphically.
* You can add new pizza types or new regions without touching the abstract PizzaStore.

---

## 🍕 Real-World Analogy

Imagine ordering a pizza from a franchise:

* The core process (prepare, bake, cut, box) is the same.
* But depending on whether you order from New York or Chicago, the pizza **type** varies.
* You don’t need to know who makes it or how — you just place the order.

This is the essence of the Factory Method.

---

## 📌 Summary

The Factory Method pattern centralizes and defers the creation of product objects, allowing better separation of concerns, easier extension, and greater flexibility. It helps avoid tightly coupled constructors spread throughout the code and improves maintainability.