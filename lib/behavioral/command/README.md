# 🎮 Command Pattern

## 🧠 Definition

The **Command Pattern** is a behavioral design pattern that turns a request into a stand-alone object that contains all information about the request. This transformation lets you pass requests as a method arguments, delay or queue a request's execution, and support undoable operations.

---

## 🚀 When to Use

- You want to **decouple the sender (invoker) from the receiver** (the object that performs the action).
- You need to support **undo/redo operations**.
- You want to **queue, log, or schedule** requests.
- You want to replace **complex conditional logic** (`if` / `switch`) with objects.
- You aim to follow **SOLID principles** (especially SRP, OCP, DIP).
- You want clearer **separation of concerns**: *when* a request runs (invoker), *what* is requested (command), and *how* work is done (receiver) stay in different places.

---
## 🧱 Structure

Client
  └── creates and configures the ConcreteCommand, then assigns it to the Invoker

Invoker (Sender)
  └── holds a Command and triggers its execution

Command (Interface)
  └── defines the `execute()` and optionally `undo()` methods

Concrete Command
└── implements the Command interface and delegates the request to the Receiver

Receiver (Worker)
  └── contains the actual business logic to perform the task


---

## ✅ Key Principles in Action

### 🔹 1. **Decoupling**
The sender (Invoker) doesn't know anything about the receiver or how the request is processed; it only knows the `Command` interface.

### 🔹 2. **Encapsulate what varies**
Each command encapsulates a specific action and the data required for it, isolating the action's logic from its caller.

### 🔹 3. **Favor composition over inheritance**
The Invoker *composes* a command object and triggers it. This allows for dynamic behavior changes at runtime.

### 🔹 4. **Code to an interface, not an implementation**
The Invoker depends on the `Command` interface, not a concrete class, making the system flexible and easy to extend.

### 🔹 5. **Separation of concerns**
The **Invoker** cares about triggering execution; each **Concrete Command** packages one request; the **Receiver** owns domain logic. Those roles are not mixed in one class, so each part is easier to read, test, and change independently.

---

## 🧱 SOLID Principles Applied

| Principle | Description |
|----------|-------------|
| **S** - Single Responsibility | Separates the class that triggers the action from the class that performs the business logic — aligns with **separation of concerns** across invoker, command, and receiver. |
| **O** - Open/Closed | New commands can be added without modifying existing Invokers, Receivers, or the Command interface. |
| **L** - Liskov Substitution | All concrete commands can be substituted for one another through the shared Command interface. |
| **I** - Interface Segregation | The Command interface is kept minimal and focused (e.g., just `execute` and `undo`). |
| **D** - Dependency Inversion | The Invoker depends on an abstraction (Command interface), not on a concrete Receiver or implementation. |

---

## 📁 Project Structure

- `core_examples/` → Console or Dart-only examples.
- `flutter_examples/` → Interactive Flutter-based examples.
- `without_pattern/` → Code with tight coupling and hardcoded logic.
- `with_command/` → Refactored version using the Command Pattern properly.

---

## 📌 Summary

The Command Pattern converts requests into first-class objects. This promotes **loose coupling**, clearer **separation of concerns** between triggering and doing work, enables **undo/redo** functionality, and makes the code highly **extensible** and **testable**. By encapsulating actions, you can manage them as data—storing, queuing, or logging them as needed.
