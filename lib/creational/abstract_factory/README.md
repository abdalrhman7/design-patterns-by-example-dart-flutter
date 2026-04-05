# 🏗️ Abstract Factory Pattern

## 🧠 Definition

The **Abstract Factory Pattern** is a creational design pattern that provides an interface for creating families of related or dependent objects without specifying their concrete classes. It allows a system to remain independent of how its objects are created, composed, and represented.

---

## 🚀 When to Use

- A system should be independent of how its products are created, composed, and represented.
- A system should be configured with one of multiple families of products.
- A family of related product objects is designed to be used together, and you need to enforce this constraint.
- You want to provide a class library of products, and you want to reveal just their interfaces, not their implementations.

---
## 🧱 Structure

Abstract Factory (interface)
  ├── ConcreteFactory1 (creates Family A)
  └── ConcreteFactory2 (creates Family B)

Abstract Product A (interface)
  ├── ProductA1 (Concrete for Family 1)
  └── ProductA2 (Concrete for Family 2)

Abstract Product B (interface)
  ├── ProductB1 (Concrete for Family 1)
  └── ProductB2 (Concrete for Family 2)


---

## ✅ Key Principles in Action

### 🔹 1. **Encapsulate Product Creation**
The Abstract Factory encapsulates the creation of a family of related products. This isolates the details of product instantiation from the client.

### 🔹 2. **Families of Products**
Ensures that products within a family are used together correctly. For example, a "Dark Theme Factory" would produce only dark-themed buttons and dark-themed icons.

### 🔹 3. **Consistency among Products**
Helps maintain a consistent look and feel or behavior across a group of related products.

### 🔹 4. **Code to an Interface**
Clients interact with factories and products through abstract interfaces, ensuring that the code remains decoupled from specific implementations.

---

## 🧱 SOLID Principles Applied

| Principle | Description |
|----------|-------------|
| **S** - Single Responsibility | The responsibility of creating families of products is centralized in dedicated factory classes. |
| **O** - Open/Closed | New product families (factories and their products) can be added without modifying existing code. |
| **L** - Liskov Substitution | All concrete factories and products can be substituted for their abstract base types. |
| **I** - Interface Segregation | Product and factory interfaces are kept specific and modular. |
| **D** - Dependency Inversion | The client depends on abstract factories and abstract products, not concrete implementations. |

---

## 📁 Project Structure

- `core_examples/` → Console or Dart-only examples.
- `flutter_examples/` → Interactive Flutter-based examples.
- `without_pattern/` → Without applying the Abstract Factory Pattern.
- `with_pattern/` → Refactored version using the Abstract Factory Pattern properly.

---

## 📌 Summary

The Abstract Factory Pattern is a powerful creational pattern that manages families of related objects. By providing a common interface for creation, it ensures consistency and loose coupling, making it significantly easier to swap out entire sets of objects at once while adhering strictly to SOLID principles.
