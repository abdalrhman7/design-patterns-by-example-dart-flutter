# Design Patterns in Flutter & Dart: By Example

Welcome to **Design Patterns in Flutter & Dart: By Example**!

## Demo

https://github.com/user-attachments/assets/01cf8e93-10dd-4a08-aaa6-03161b18cb04

---

## About The Project

This is an **educational project** designed to bridge the gap between theoretical design patterns and practical, real-world application development.

Instead of just showing the final abstract code, this project takes a practical, step-by-step approach:
1. **The Problem:** We first present a realistic scenario and write the code *without* using any design patterns. This highlights the common pain points, tight coupling, and SOLID violations you might face in real apps.
2. **The Solution:** We then refactor that code using the appropriate design pattern, explaining exactly *why* and *how* the pattern solves the initial problem.
3. **Practical Flutter Implementation:** Finally, we take it a step further by demonstrating the pattern with a working, interactive **Flutter UI**. This allows you to see the design pattern in action visually and understand how it integrates into your everyday app development.

If you've ever found design patterns to be too theoretical or hard to apply in a real Flutter project, this repository is built specifically for you!

---

## Why this project?

Learning design patterns can be abstract and confusing. This project simplifies the learning curve by providing:
1.  **The "Problem"**: Code written *without* the pattern to illustrate common pitfalls and SOLID violations.
2.  **The "Solution"**: A refactored version using the pattern, explaining *how* and *why* it solves the problem.
3.  **Core Logic**: Pure Dart examples to focus on the pattern's mechanics.
4.  **UI Implementation**: Realistic Flutter examples to see the pattern in action within a mobile/web context.

---

## Repository Structure

Each pattern is organized in a clear, consistent hierarchy:

```text
lib/
└── [Category]/
    └── [PatternName]/
        ├── README.md              # Detailed explanation of the pattern
        ├── core_examples/         # Pure Dart / Console implementations
        │   └── [Example]/
        │       ├── without_pattern/
        │       └── with_pattern/
        └── flutter_examples/      # Interactive Flutter UI examples
```

---

## Implemented Patterns

### Creational Patterns
| Pattern | Description
|:--- |:--- |:---:|
| **Abstract Factory** | Creating families of related objects.
| **Factory Method** | Instantiating objects without specifying concrete classes.
| **Singleton** | Ensuring a class has only one instance.

### Structural Patterns
| Pattern | Description
|:--- |:--- |:---:|
| **Adapter** | Converting an interface into another expected by clients.
| **Composite** | Composing objects into tree structures to represent part-whole hierarchies.
| **Decorator** | Adding responsibilities to objects dynamically.
| **Facade** | Providing a simplified interface to a complex system.
| **Proxy** | Providing a surrogate or placeholder for another object to control access to it.

### Behavioral Patterns
| Pattern | Description
|:--- |:--- |:---:|
| **Command** | Encapsulating a request as an object.
| **Iterator** | Accessing elements of a collection sequentially without exposing its representation.
| **Observer** | One-to-many dependency notification.
| **State** | Allowing an object to alter its behavior when its internal state changes.
| **Strategy** | Encapsulating interchangeable algorithms.
| **Template Method** | Defining an algorithm's skeleton in a superclass.

---

## Design Principles Applied

Every example is built with a focus on:
*   **SOLID Principles**: Ensuring code is maintainable, extensible, and robust.
*   **Abstractions**: Coding to an interface, not an implementation.
*   **Composition**: Favoring composition over inheritance for maximum flexibility.
*   **Decoupling**: Reducing dependencies between high-level and low-level modules.


---


## Path to Mastery
1.  Read the `README.md` inside each pattern folder.
2.  Examine the `without_pattern` code to identify the pain points.
3.  Study the `with_pattern` refactor and the comments explaining the principles.
4.  Run the Flutter example to see the dynamic behavior.

---

## Screenshot

<img width="1024" height="1536" alt="DesignPatterns" src="https://github.com/user-attachments/assets/be6af8a1-eccc-411d-a710-88fb4fc1be40" />

