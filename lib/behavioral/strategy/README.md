# 🎯 Strategy Pattern

## 🧠 Definition

The **Strategy Pattern** is a behavioral design pattern that defines a family of algorithms, encapsulates each one, and makes them interchangeable. This allows the algorithm to vary independently from the clients that use it.

---

## 🚀 When to Use

- You have multiple classes that differ only in behavior (logic).
- You want to switch between behaviors (algorithms) dynamically at runtime.
- You want to eliminate long conditional blocks (`if`, `switch`) by encapsulating the logic.
- You aim to follow SOLID principles (especially SRP, OCP, DIP).
- You want to isolate and test each behavior independently.

---
## 🧱 Structure

Context
  └── has a reference to a Strategy

Strategy (interface)
  ├── ConcreteStrategyA
  └── ConcreteStrategyB


---

## ✅ Key Principles in Action

### 🔹 1. **Polymorphism**
The context interacts with different strategies through a common interface, allowing behavior changes without modifying the context.

### 🔹 2. **Encapsulate what varies**
Each concrete strategy encapsulates a specific behavior, isolating the parts of code that are likely to change.

### 🔹 3. **Favor composition over inheritance**
The context *composes* a strategy object rather than inheriting from one. This promotes reusability and flexibility.

### 🔹 4. **Code to an interface, not an implementation**
The context depends on an abstraction (strategy interface), not a concrete class, enabling flexibility and adherence to good design principles.

---

## 🧱 SOLID Principles Applied

| Principle | Description |
|----------|-------------|
| **S** - Single Responsibility | Each class has one clear responsibility — either *when* to execute or *how* to execute a behavior. |
| **O** - Open/Closed | New strategies can be added without modifying existing context or strategy interface. |
| **L** - Liskov Substitution | All strategy implementations can be substituted for one another via the shared interface. |
| **I** - Interface Segregation | Strategy interfaces are kept focused and minimal. |
| **D** - Dependency Inversion | Context depends on abstractions (strategy interface), not concrete implementations. |

---

## 📁 Project Structure

- `core_examples/` → Console or Dart-only examples.
- `flutter_examples/` → Interactive Flutter-based examples.
- `without_pattern/` → Without applying the Strategy Pattern
- `with_strategy/` → Refactored version using the Strategy Pattern properly.

---

## 📌 Summary

The Strategy Pattern is one of the simplest yet most powerful behavioral patterns. It enables dynamic behavior changes, cleaner code, and better adherence to SOLID principles. By encapsulating algorithms and coding to abstractions, it enhances reusability, testability, and long-term maintainability.



