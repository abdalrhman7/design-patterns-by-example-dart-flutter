# 🔄 State Pattern

## 🧠 Definition

The  **State Pattern**  is a behavioral design pattern that allows an object to change its behavior when its internal state changes. Instead of using conditional logic, the behavior is delegated to separate state objects, making it appear as if the object changes its class at runtime.

---

## 🚀 When to Use

- When you have an object that behaves differently depending on its current state, the number of states is huge, and the state-specific code changes frequently.
- When you have code heavily polluted with massive `if` or `switch` statements that alter how the object behaves based on some "current state" variable.

---

## 🧱 Structure

`Context` (The main object interacting with the client)
  ├── Holds a reference to the current `State` object.
  ├── Delegates state-specific work to this `State` object.
  |
`State` (Abstract Interface)
  ├── Defines standard behaviors associated with a particular state of the `Context`.
  |
  ├── `ConcreteStateA` (Concrete Class)
  |      └── Implements behavior specific to State A. Can also initiate transitions to other states.
  |
  └── `ConcreteStateB` (Concrete Class)
         └── Implements behavior specific to State B. Can also initiate transitions to other states.

---

## ✅ Key Principles in Action

### 🔹 1. **Encapsulate What Varies**
The fundamental principle of the State Pattern. Instead of having a single class that tries to handle all variations of behavior through conditional logic, you take the behaviors that vary (the states) and encapsulate them into their own distinct classes. This isolates the logic and makes it easy to add or modify states without touching the main Context class.

### 🔹 2. **Favor Composition Over Inheritance**
Instead of creating a separate subclass for each state, the Context maintains a reference to a State object. At runtime, this reference can be replaced, allowing the Context to change its behavior dynamically without changing its own class or using inheritance-based branching.
### 🔹 3. **State Transitions are Explicit**
Transitions from one state to another become explicit class swaps (changing the reference in the Context from `StateA` to `StateB`) rather than hidden variable assignments scattered throughout a monolithic class.

---

## 🧱 SOLID Principles Applied

| Principle | Description |
|----------|-------------|
| **S** - Single Responsibility | The `Context` only handles the client interface, while each `ConcreteState` class handles only the behavior specific to that exact state. No single class is responsible for everything. |
| **O** - Open/Closed | You can easily introduce new states into the application by creating a new `ConcreteState` class without modifying existing state classes or the `Context` class. |
| **D** - Dependency Inversion | The `Context` depends on the abstract `State` interface, not on concrete state implementations. This allows the states to be swapped flexibly. |

---

## 📌 Summary

The State Pattern cleans up monolithic code by mapping varying behaviors conceptually into independent state objects. By using composition to hold the current state and delegating behavior to it, the application embraces encapsulation and open/closed principles, turning tangled conditional logic into polymorphic bliss.
