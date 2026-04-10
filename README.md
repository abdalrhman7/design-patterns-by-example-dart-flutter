## 🧠 Why this project?

Learning design patterns can be abstract and confusing. This project simplifies the learning curve by providing:
1.  **The "Problem"**: Code written *without* the pattern to illustrate common pitfalls and SOLID violations.
2.  **The "Solution"**: A refactored version using the pattern, explaining *how* and *why* it solves the problem.
3.  **Core Logic**: Pure Dart examples to focus on the pattern's mechanics.
4.  **UI Implementation**: Realistic Flutter examples to see the pattern in action within a mobile/web context.

---

## 📁 Repository Structure

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

##  Implemented Patterns

###  Creational Patterns
| Pattern | Description | Status |
|:--- |:--- |:---:|
| **Abstract Factory** | Creating families of related objects. | ✅ |
| **Factory Method** | Instantiating objects without specifying concrete classes. | ✅ |
| **Singleton** | Ensuring a class has only one instance. | ✅ |

###  Structural Patterns
| Pattern | Description | Status |
|:--- |:--- |:---:|
| **Decorator** | Adding responsibilities to objects dynamically. | ✅ |

###  Behavioral Patterns
| Pattern | Description | Status |
|:--- |:--- |:---:|
| **Strategy** | Encapsulating interchangeable algorithms. | ✅ |
| **Observer** | One-to-many dependency notification. | ✅ |

---

## ✅ Design Principles Applied

Every example is built with a focus on:
*   **SOLID Principles**: Ensuring code is maintainable, extensible, and robust.
*   **Abstractions**: Coding to an interface, not an implementation.
*   **Composition**: Favoring composition over inheritance for maximum flexibility.
*   **Decoupling**: Reducing dependencies between high-level and low-level modules.


---


## 📌 Path to Mastery
1.  Read the `README.md` inside each pattern folder.
2.  Examine the `without_pattern` code to identify the pain points.
3.  Study the `with_pattern` refactor and the 🔹 comments explaining the principles.
4.  Run the Flutter example to see the dynamic behavior.

---

## 📸 Screenshot

<img width="1024" height="1536" alt="DesignPatterns" src="https://github.com/user-attachments/assets/be6af8a1-eccc-411d-a710-88fb4fc1be40" />

