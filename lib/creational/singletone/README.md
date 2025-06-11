
# 🔒 Singleton Pattern

## 🧠 Definition

The Singleton design pattern is a creational pattern that ensures a class has only **one instance** and provides a **global point of access** to that instance. This is useful when exactly one object is needed to coordinate actions across the system.

### 🔑 Key aspects of the Singleton pattern:

- **Single shared instance**  
  Ensures that only one instance of the class exists across the entire application.

- **Global access point**  
  Provides a static method (commonly called `getInstance()` or a `factory` constructor in Dart) to retrieve the unique instance.

- **Lazy initialization**  
  The instance is created only when it's needed, saving resources.

- **State retention**  
  Since the same instance is reused, any changes made to its internal state persist across the app.

---

## 🚀 When to Use

- When an object should **only exist once** across the app (e.g. settings, shared state, config).
- When you want to **preserve state** across screens or widget rebuilds without relying on global variables.
- When you want to **coordinate behavior** or **manage shared resources**, such as a cache, theme manager, or authentication token.

---

## 📱 Flutter UI Example

In Flutter, you can use Singleton to retain data across screen transitions.

For example:

- `SingletonCounter` keeps count value even if you navigate away and back.
- `NonSingletonCounter` always starts from 0 when the widget is rebuilt.

This helps in **state sharing without using state management tools**.

---

## 🧱 Structure

**Singleton (class with private constructor and static instance)**  
↳ Provides a shared instance and exposes methods to modify or retrieve state.

**Client (e.g. UI Widget)**  
↳ Interacts with the Singleton through its public API.

```
Client → Singleton.getInstance()
```

---

### ✅ Dart Implementation (Simplified)

```dart
class SingletonCounter {
  static final SingletonCounter _instance = SingletonCounter._internal();

  int _count = 0;

  SingletonCounter._internal();

  factory SingletonCounter() => _instance;

  void increment() => _count++;
  int get count => _count;
}
```

---

## ✅ Key Principles in Action

### 🔹 1. Single Instance
There’s always one object used across your app. You modify it once — and everyone sees the change.

### 🔹 2. Global Access
You can access the singleton from anywhere using:

```text
SingletonCounter().increment();
```

### 🔹 3. Lazy Initialization
The object is only initialized when accessed for the first time — good for performance.

---


## 📁 Project Structure

* `core_examples/` → Simple Dart examples showing how Singleton enforces single-instance behavior.
* `flutter_examples/` → Flutter UI examples showing Singleton usage in a real app context.
* `without_pattern/` → Same logic without Singleton — useful for comparison.
* `with_singleton/` → Refactored version using Singleton to persist shared state.

---

## 🎯 Real-World Analogy

Think of a **printer spooler** in an office:

- Only one queue is allowed to control print jobs at a time.
- If multiple instances existed, prints would clash.
- Singleton ensures only one queue controller manages the printer.

---

## 🧰 Flutter Insight

In Flutter, using a Singleton allows you to:

- **Retain data** across navigation without passing arguments or using state management.
- **Share services** (e.g. logging, analytics, configs).

Example:

```text
final counter = SingletonCounter();
counter.increment();
print(counter.count); // Will persist even after navigation 
```

---

## 📌 Summary

The Singleton Pattern ensures that a class has only one instance and that instance is accessible globally. In Flutter, it is especially useful for sharing state or services across your app — without resorting to complex state management.

> ✅ Use it wisely to keep your code clean, consistent, and shared across components.
