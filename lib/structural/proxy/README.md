# 🛡️ Proxy Pattern

## 🧠 Definition

The **Proxy Pattern** is a structural design pattern that provides a surrogate or placeholder for another object to control access to it. It acts as an intermediary, intercepting calls to the "Real Subject" to perform additional logic such as lazy initialization, logging, access control, or caching.

---

## 🚀 When to Use

- **Virtual Proxy (Lazy Loading):** When you have a heavyweight object (like a large image or a database connection) that you only want to create or load when it is actually needed.
- **Protection Proxy (Access Control):** When you want to restrict which clients can access certain methods of the real object based on permissions/roles.
- **Remote Proxy (Local Representative):** When the real object exists in a different address space (e.g., a network service), and you want a local object to represent it.
- **Logging/Monitoring Proxy:** When you want to keep a history of requests or measure performance of the real object without modifying its core code.
- **Caching Proxy:** When you want to store the results of expensive operations from the real object to serve them faster to subsequent clients.

---

## 🧱 Structure

`ServiceInterface` (Interface/Abstract Class)
   ├── Defines the common operations for both the Real Service and the Proxy.
   |
   ├── `RealService` (Concrete Class)
   |      └── The actual object that performs the heavy lifting or contains the core logic.
   |
   └── `Proxy` (Concrete Class)
          ├── Maintains a reference to the `RealService`.
          ├── Implements the exact same `ServiceInterface`.
          └── Intercepts calls to perform extra logic before/after delegating to the `RealService`.

---

## ✅ Key Principles in Action

### 🔹 1. **Control Access**
The main responsibility of a Proxy is to manage the lifecycle or access permissions of the real object. The client interacts with the Proxy, thinking it's the real service, while the Proxy decides if, when, and how to involve the actual heavy object.

### 🔹 2. **Transparency**
Because the Proxy and the Real Service implement the same interface, the client code doesn't need to know it's talking to a surrogate. This allows you to swap a direct connection for a proxied one without breaking any existing code.

### 🔹 3. **Separation of Concerns**
The core business logic stays inside the `RealService`, while "cross-cutting concerns" like security, caching, or lazy-loading are extracted into the `Proxy`. This keeps the classes small and focused (SRP).

---

## 🧱 SOLID Principles Applied

| Principle | Description |
|----------|-------------|
| **S** - Single Responsibility | The `RealService` focuses on the business logic, while the `Proxy` handles auxiliary tasks like access control or caching. |
| **O** - Open/Closed | You can introduce new proxies (e.g., a LoggerProxy then a CacheProxy) without changing the existing `RealService` or client code. |
| **D** - Dependency Inversion | The Client depends on the abstract `ServiceInterface`, allowing either the Proxy or the RealService to be injected interchangeably. |

---

## 📌 Summary

The Proxy Pattern introduces an intermediary that controls access to another object while keeping the same interface. This allows adding behaviors like lazy loading, caching, and security without changing the original object's code.