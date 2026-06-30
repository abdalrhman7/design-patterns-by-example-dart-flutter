/// 🧠 Example Context: Delivery System (Composite Pattern)
/// -------------------------------------------------------------
/// Imagine a real-world delivery system:
///
/// - You can order individual products (like a phone or charger).
/// - You can also group multiple products into a box.
/// - And that box itself can contain smaller boxes inside it.
///
/// Example:
/// Main Box
///   ├── Electronics Box
///   │     ├── Phone
///   │     └── Charger
///   ├── Earbuds
///   └── Receipt
///
/// 💡 The key idea:
/// Whether it's a single product OR a full box,
/// we want to treat them the SAME way.
///
/// For example:
/// - Get total price → works for product or box
/// - Display structure → works for product or box
///
/// 👉 This is exactly what the Composite Pattern solves:
/// It lets us treat individual objects and groups of objects uniformly.
///
/// In this example:
/// - Product = Leaf (single item)
/// - DeliveryBox = Composite (can contain items)
/// - DeliveryComponent = common interface
library;

// 🔹 1. Component (The common interface)
// -------------------------------------------------------------
// This abstract class declares operations that are common to both
// simple and complex objects of a tree.
abstract class DeliveryComponent {
  double getPrice();
  void display([String indent = '']);
}

// -------------------------------------------------------------
// 🔹 2. Leaf (Atomic Element)
// -------------------------------------------------------------
// Represents the actual end-objects in the tree. Leaves can't have children.
// They do the actual work.
class Product implements DeliveryComponent {
  final String title;
  final double price;

  Product(this.title, this.price);

  @override
  double getPrice() {
    return price; // Leaf just returns its own price
  }

  @override
  void display([String indent = '']) {
    print('$indent- $title: \$$price');
  }
}

// -------------------------------------------------------------
// 🔹 3. Composite (Container Element)
// -------------------------------------------------------------
// Represents complex components that may have children.
// Composites delegate actual work to their children.
class DeliveryBox implements DeliveryComponent {
  final String title;

  // 🔹 Uniformity: Notice it holds an array of 'DeliveryComponent',
  // which means it can silently hold BOTH separate 'Product's AND nested 'DeliveryBox'es!
  final List<DeliveryComponent> _children = [];

  DeliveryBox(this.title);

  void add(DeliveryComponent component) {
    _children.add(component);
  }

  void remove(DeliveryComponent component) {
    _children.remove(component);
  }

  @override
  double getPrice() {
    // 🔹 Recursive Delegation
    // The box doesn't calculate prices manually. It just asks all its children!
    // Since nested boxes also implement getPrice(), they will ask THEIR children, and so on.
    return _children.fold(0.0, (total, child) => total + child.getPrice());
  }

  @override
  void display([String indent = '']) {
    print('$indent📦 Box: $title');
    for (var child in _children) {
      child.display('$indent   '); // Recursive indentation
    }
  }
}
