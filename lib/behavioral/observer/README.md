# 🔁 Observer Pattern

## 🧠 Definition

The **Observer Pattern** is a behavioral design pattern that defines a one-to-many dependency between objects. When the state of the **Observable** (aka Subject) changes, all its **Observers** are automatically notified and updated. This allows a loosely coupled system where different parts can react to changes without tightly depending on each other.

---

## 🚀 When to Use

- When multiple objects need to stay in sync with the state of another object.
- When you want to implement event-driven or reactive systems.
- When you want to decouple objects without losing communication between them.
- In UI frameworks, notification systems, or real-time data updates.

---

## 🧱 Structure

**Observable**  
  └── Maintains a list of observers and notifies them of state changes.

**Observer (interface)**  
  ├── ConcreteObserverA  
  └── ConcreteObserverB

---

## ✅ Key Principles in Action

### 🔹 1. **Loose Coupling**
The Observable doesn't need to know the internal logic of its observers — just that they implement a specific interface. Observers can change or be replaced independently.

### 🔹 2. **Separation of Concerns**
Each object is responsible for one thing:
- The Observable manages state and notifications.
- Observers decide how to react when notified.  
  This clear separation reduces interdependence and complexity.

### 🔹 3. **Open for Extension**
You can add new observer types without changing the Observable class — just register them.

### 🔹 4. **Dynamic Relationships**
Observers can subscribe/unsubscribe at runtime, allowing flexible and extensible behavior.

---

## 🧱 SOLID Principles Applied

| Principle | Description |
|----------|-------------|
| **S** - Single Responsibility | Observable handles state + notification. Observers handle their own response logic. |
| **O** - Open/Closed | New observers can be added without changing existing code. |
| **D** - Dependency Inversion | Both Observable and Observers depend on abstractions, not concrete implementations. Observable calls `update` on the abstract `Observer` interface, and Observers rely on the contract, not the Observable's internal logic. |

---

## 📁 Project Structure

- `core_examples/` → Basic Dart examples using Observer Pattern.
- `flutter_examples/` → UI-driven examples with reactive widget behavior.
- `without_pattern/` → Coupled version without Observer Pattern.
- `with_observer/` → Refactored version applying Observer Pattern cleanly.

---

## 📌 Summary

The Observer Pattern is ideal for scenarios where changes in one object need to automatically trigger updates in others — without tight coupling. It promotes flexibility, testability, and responsiveness, and is fundamental in many architectures like MVC, MVVM, and reactive programming. By leveraging interfaces and dynamic subscriptions, the system becomes more modular and extensible.
