import 'package:design_patterns_flutter/creational/factory_method/core_examples/without_factory_method/pizza_without_factory_method.dart';


// 🧪 Client Code
testBadPizzaStore() {
  final store = BadPizzaStore();
  final pizza1 = store.orderPizza('cheese');
  print('Ordered: ${pizza1.name}\n');

  final pizza2 = store.orderPizza('veggie');
  print('Ordered: ${pizza2.name}\n');

  // To support more pizza types (e.g., "clam", "pepperoni"),
  // we'd need to keep adding if-else statements in the store — not scalable!
}

void main() {
  testBadPizzaStore();
}
