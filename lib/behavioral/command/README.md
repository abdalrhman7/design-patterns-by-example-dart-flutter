# 📋 Command Pattern

## 🧠 Definition

The **Command Pattern** is a behavioral design pattern that turns a request into a stand-alone object containing all information about the request. This object can be passed, stored, queued, logged, and supports reversible operations (undo/redo) without the caller needing to know how the work is done.

---

## 🚀 When to Use

- You want to **decouple the sender (invoker) from the receiver** (the object that performs the action).
- You need to support **undo/redo operations**.
- You want to **queue, log, or schedule** requests.
- You want to replace **complex conditional logic** (`if` / `switch`) with objects.
- You aim to follow **SOLID principles** (especially SRP, OCP, DIP).

---

## 🧱 Structure

Client
  └── creates a ConcreteCommand and sets its receiver

Invoker
  └── stores a Command and calls execute() (and optionally undo())

Command (interface)
  ├── execute()
  └── optional: undo()

ConcreteCommand
  └── forwards execute()/undo() to the Receiver

Receiver
  └── knows how to perform the actual work


---

## ✅ Key Principles in Action

### 🔹 1. **Encapsulate a request as an object**
The “what to do” and “with what” live inside the command, not spread across the invoker. That improves **separation of concerns** and makes behavior easy to reuse.

### 🔹 2. **Decouple sender from doer**
The invoker depends only on the **Command** abstraction, not on concrete receivers or low-level APIs. That reduces **tight coupling** and stabilizes high-level code.

### 🔹 3. **Single level of indirection for cross-cutting features**
Because requests are objects, you can add **logging**, **validation**, **transactions**, **queues**, or **undo stacks** in one place without changing every call site.

### 🔹 4. **Code to an interface, not an implementation**
Invoker and client work against `Command`, not specific receiver methods—aligned with **dependency inversion** and easier **unit testing** (mock commands or receivers).

---

## 🧱 SOLID Principles Applied

| Principle | Description |
|-----------|-------------|
| **S** - Single Responsibility | Each command class represents **one** user intent or operation; the invoker only triggers execution; the receiver only performs domain actions. |
| **O** - Open/Closed | New operations are added by **new command classes** without modifying existing invokers or receivers (when designed around a stable `Command` interface). |
| **L** - Liskov Substitution | Any `Command` implementation can replace another where the contract is `execute()` / `undo()` (if present). |
| **I** - Interface Segregation | Keep command interfaces minimal (e.g. split “executable” from “undoable” if not every command supports undo). |
| **D** - Dependency Inversion | Invoker and high-level modules depend on the **Command** abstraction, not concrete receivers or UI details. |

---

## 📁 Project Structure

- `core_examples/` → Console or Dart-only examples.
- `flutter_examples/` → Interactive Flutter-based examples.
- `without_pattern/` → Imperative, tightly coupled calls (e.g. UI or client directly invokes receiver methods).
- `with_command/` → Refactored version using the Command Pattern (commands, invoker, receiver).

---

## 📌 Summary

The Command Pattern treats actions as first-class objects. That improves **separation of concerns**, weakens **tight coupling** between triggers and implementations, and opens the door to **undo**, **queues**, and clearer **SOLID**-friendly designs—especially in UIs and apps where the same operation must be triggered from many places or recorded for later.

