# Iterator Pattern

## Definition

The **Iterator Pattern** is a behavioral design pattern that allows you to traverse elements of a collection without exposing its underlying representation (like lists, stacks, trees, or custom data structures). It provides a standard way to loop through a group of items, regardless of how they are organized internally.

---

## When to Use

- When your collection has a complex data structure under the hood, but you want to hide its complexity from clients.
- When you want to reduce duplication of traversal code across your application.
- When you need to iterate over the same collection simultaneously in different parts of your code (each iterator maintains its own independent state).

---
## Structure

`IterableCollection` (interface)
  ├── Defines `createIterator()` method
  └── `ConcreteCollection` (Implements collection logic & returns specific Iterator)

`Iterator` (interface)
  ├── Defines methods like `hasNext()` and `next()`
  └── `ConcreteIterator` (Implements traversal logic and tracks current state)


---

## Key Principles in Action

### 1. **Encapsulation of Traversal**
The logic for traversing the data is extracted completely out of the collection class. This means the client code doesn't need to know if the data is stored in an Array, a Linked List, or a Binary Tree.

### 2. **Uniform Interface**
Clients interact with collections via a standard `Iterator` interface. This allows you to write polymorphic code that can process any kind of collection as long as it provides an iterator.

### 3. **Independent Traversal State**
Because every iterator object contains its own iteration state (like the current index or current node), multiple iterators can traverse the same collection independently at the same time.

---

## SOLID Principles Applied

| Principle | Description |
|----------|-------------|
| **S** - Single Responsibility | Cleans up the collection classes by extracting bulky traversal algorithms into separate Iterator classes. The collection focuses on data storage, the iterator focuses on traversal. |
| **O** - Open/Closed | You can implement new types of collections and entirely new traversal algorithms (Iterators) without breaking existing client code or the collections themselves. |

---

## Project Structure

- `core_examples/` → Console or Dart-only examples (e.g., traversing a custom Graph, Tree, or custom company hierarchy).
- `flutter_examples/` → Interactive Flutter-based examples (e.g., stepping through a timeline, pagination simulation, or UI step-by-step wizard).
- `without_pattern/` → Code trying to loop through different complex data structures by hardcoding loops and exposing internal properties.
- `with_pattern/` → Refactored code standardizing traversal using the Iterator Pattern.

---

## Summary

The Iterator Pattern simplifies code by decoupling algorithms from the data structures they operate on. It provides a clean, abstract, and standardized way to loop over elements, making your codebase more robust, interchangeable, and ready to scale with new data models without rewriting your `for` loops.
