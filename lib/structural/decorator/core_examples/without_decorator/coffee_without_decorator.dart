// === Simple Coffee Model ===
// 🔸 A tightly-coupled class that models a coffee object with two optional features: milk and sugar.
// 🔸 All feature logic is embedded directly inside the class.
// 🔸 ❌ Violates the Single Responsibility Principle (SRP): this class manages both the core coffee logic and extra feature logic.
// 🔸 ❌ Violates Open/Closed Principle (OCP): adding new features (like caramel or whipped cream) requires modifying this class.
// 🔸 ❌ Not flexible or scalable for future extensions.

class Coffee {
  bool hasMilk;
  bool hasSugar;

  // 🔸 Constructor with flags for features
  Coffee({this.hasMilk = false, this.hasSugar = false});

  // 🔹 Builds the coffee description based on the enabled flags
  String getDescription() {
    String description = "Simple Coffee";

    if (hasMilk) {
      description += ", Milk";
    }
    if (hasSugar) {
      description += ", Sugar";
    }

    return description;
  }

  // 🔹 Computes cost based on selected features
  double getCost() {
    double cost = 5.0; // Base cost

    if (hasMilk) {
      cost += 1.5;
    }
    if (hasSugar) {
      cost += 0.5;
    }

    return cost;
  }
}
