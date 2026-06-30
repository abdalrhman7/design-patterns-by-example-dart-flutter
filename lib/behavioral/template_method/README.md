# Template Method Pattern

## Definition

The **Template Method Pattern** is a behavioral design pattern that defines the skeleton of an algorithm in the superclass but lets subclasses override specific steps of the algorithm without changing its structure.

---

## When to Use

- You have multiple classes that contain **almost identical algorithms** with some minor differences.
- You want to **avoid code duplication** by pulling common behavior into a base class.
- You want to **control the points of extension** where subclasses can modify the algorithm.
- You want to enforce a **fixed sequence of steps** in an algorithm while allowing flexibility in the implementation of those steps.

---
## Structure

Abstract Class (Base)
  ├── Defines the `templateMethod()` (the algorithm skeleton)
  ├── Implements **Common Steps** (logic shared by all)
  ├── Declares **Abstract Methods** (steps that MUST be implemented by subclasses)
  └── Declares **Hooks** (optional steps with default/empty implementation)

Concrete Class (Subclass)
  └── Implements abstract steps and optionally overrides hooks


---

## Key Principles in Action

### 1. **The Hollywood Principle**
"Don't call us, we'll call you." The base class controls the algorithm's flow and calls the methods implemented in the subclasses at the right time.

### 2. **Encapsulate what varies**
The invariant parts (steps that never change) stay in the base class, while variant parts (individual steps) are delegated to subclasses.

### 3. **Hooks (Optional Extension)**
Hooks are methods with a default (often empty) implementation in the base class. They allow subclasses to "hook into" the algorithm at specific points **optionally**, without being forced to override them if not needed.

### 4. **Code Reusability**
Common logic is written once in the superclass, preventing "code rot" and making maintenance easier across all variations.

### 5. **Fixed Algorithm Skeleton**
The template method is usually marked as `final` (or equivalent) to ensure subclasses can't change the execution order of the steps.

---

## SOLID Principles Applied

| Principle | Description |
|----------|-------------|
| **S** - Single Responsibility | The base class is responsible for the overall algorithm structure, while subclasses handle specific step details. |
| **O** - Open/Closed | You can add new algorithm variations (subclasses) without changing the base class's template method. |
| **L** - Liskov Substitution | Subclasses can be used anywhere the base class is expected without breaking the algorithm's structure. |

---

## Project Structure

- `core_examples/` → Console or Dart-only examples (e.g., Data Parser or Brewing Coffee/Tea).
- `flutter_examples/` → Interactive Flutter-based examples (e.g., UI Page Loader or Animation Sequences).
- `without_pattern/` → Code with duplicated logic across multiple classes.
- `with_template_method/` → Refactored version using the Template Method Pattern properly.

---

## Summary

The Template Method Pattern is a powerful tool for **reducing code duplication** and **enforcing a standard process**. By defining a fixed skeleton and allowing controlled customization, it creates a clean, maintainable architecture that adheres to the best design principles.
