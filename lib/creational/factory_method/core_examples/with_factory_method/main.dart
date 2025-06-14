import 'package:design_patterns_flutter/creational/factory_method/core_examples/with_factory_method/pizza_factory_method.dart';

// ——— Client Code ———

// 🔹 Client depends on abstraction (PizzaStore), not concrete implementations.
// 🔹 Decouples creation from usage — Dependency Inversion Principle (SOLID).


void main() {
  PizzaStore nyStore = NYPizzaStore();
  PizzaStore chicagoStore = ChicagoPizzaStore();

  final pizza1 = nyStore.orderPizza('cheese');
  print('Ethan ordered a $pizza1\n');

  final pizza2 = chicagoStore.orderPizza('veggie');
  print('Joel ordered a $pizza2\n');
}
