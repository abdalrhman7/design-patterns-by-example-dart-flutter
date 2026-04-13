# 🔌 Adapter Pattern

## 🧠 Definition

The **Adapter Pattern** is a structural design pattern that lets classes with incompatible interfaces work together.  
It does this by introducing an adapter object that converts one interface into another interface the client expects.

---

## 🚀 When to Use

- You need to use an existing class, but its API does not match what your code expects.
- You want to integrate third-party or legacy code without changing the client code.
- You want to avoid spreading conversion logic everywhere in the codebase.
- You want cleaner **separation of concerns** by isolating compatibility logic in one place.
- You want to apply **delegation** so the adapter forwards work to the wrapped object.

---
## 🧱 Structure

Client
  └── depends on Target interface

Target (interface expected by client)
  └── defines the operations client uses

Adaptee (existing/legacy class)
  └── provides useful behavior but with incompatible API

Adapter
  ├── implements Target
  └── holds an Adaptee and delegates calls after converting data/signatures


---

## ✅ Key Principles in Action

### 🔹 1. **Interface Translation**
The adapter converts calls from the `Target` interface into calls the `Adaptee` understands.

### 🔹 2. **Delegation**
The adapter usually does not reimplement core business logic.  
Instead, it **delegates** to the wrapped adaptee object, adding only the conversion/mapping needed.

### 🔹 3. **Separation of Concerns**
Compatibility code lives in one adapter class, not mixed inside clients or domain logic.

### 🔹 4. **Open/Closed**
You can add new adapters for new external APIs without changing stable client code.

---

## 🧱 SOLID Principles Applied

| Principle | Description |
|----------|-------------|
| **S** - Single Responsibility | Adapter focuses on one job: translating interface differences. |
| **O** - Open/Closed | Support new external systems by adding new adapters, not modifying client code. |
| **L** - Liskov Substitution | Any adapter implementing `Target` can be used interchangeably by the client without breaking its behavior. |
| **I** - Interface Segregation | The Target interface is kept small and focused, so clients are not forced to depend on unnecessary methods. |
| **D** - Dependency Inversion | High-level code depends on `Target` abstraction, not concrete third-party classes. |

---

## 🔁 How Delegation Appears Here

Inside an adapter, the flow is usually:

1. Receive call through `Target` method (the API your app expects).
2. Transform arguments/format if needed.
3. **Delegate** the real work to `Adaptee`.
4. Transform result back to the shape expected by client.

So delegation is the core mechanic that makes Adapter clean:  
adapter = translator + forwarder.

---

## 📁 Project Structure

- `core_examples/` → Console or Dart-only examples.
- `flutter_examples/` → Interactive Flutter-based examples.
- `without_pattern/` → Direct integration with incompatible APIs, often duplicated mapping logic.
- `with_adapter/` → Refactored version using Adapter + delegation properly.

---

## 📌 Summary

The Adapter Pattern helps you integrate incompatible APIs safely and cleanly.  
By isolating translation in adapter classes and **delegating** actual work to wrapped objects, you reduce coupling, improve maintainability, and keep client code stable even when external interfaces differ.

