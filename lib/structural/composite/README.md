# 🌳 Composite Pattern

## 🧠 Definition

The **Composite Pattern** is a structural design pattern that lets you compose objects into tree structures to represent part-whole hierarchies. The core idea is to allow clients to treat individual objects (Leaves) and compositions of objects (Composites) uniformly. 

---

## 🚀 When to Use

- When you have data that can be structured beautifully as a **Tree** (e.g., File Systems, Organizational Charts, Product Categories, UI Widget Trees).
- When you want your client code to treat simple elements and complex groups of elements in the **exact same way** without writing messy `if (isGroup)` or `if (isSingleItem)` checks.

---

## 🧱 Structure

`Component` (Abstract Interface)
  ├── Defines standard operations (e.g., `calculatePrice()`, `render()`)
  |
  ├── `Leaf` (Concrete Class)
  |      └── A basic element with no children. It does the actual work.
  |
  └── `Composite` (Concrete Class)
         └── A container element that holds a list of `Component` children. It delegates the work to its children.

---

## ✅ Key Principles in Action

### 🔹 1. **Uniformity (Treat them all the same)**
By having both Leaves and Composites implement the exact same `Component` interface, the client code can interact with any node in the tree without knowing its complexity.

### 🔹 2. **Recursive Delegation**
When a Composite receives a command, it doesn't do the heavy lifting itself. Instead, it iterates over its children and delegates the command to them. If a child is another Composite, it passes the command down further until it reaches the Leaves.

### 🔹 3. **Simplified Client Code**
Because of the uniform interface, the client can execute an operation over the entire tree or a single leaf using exactly the same method call.

---

## 🧱 SOLID Principles Applied

| Principle | Description |
|----------|-------------|
| **O** - Open/Closed | You can introduce new element types (new Leaves or new Containers) into the app without breaking the existing client code, since the client only talks to the `Component` interface. |
| **D** - Dependency Inversion | High-level modules (clients) depend on the abstract Component interface, while low-level modules (Leaf and Composite) also depend on the same abstraction. |


---

## 📌 Summary

The Composite Pattern allows clients to work with complex tree structures as if they were simple objects by unifying the interface for both individual elements and compositions. This eliminates conditional logic and enables clean, recursive designs.