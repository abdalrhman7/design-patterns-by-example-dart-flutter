import 'coffee_without_decorator.dart';

// === Usage Without Decorator Pattern ===
void main() {
  // Order 1: Simple coffee
  Coffee coffee1 = Coffee();
  print('${coffee1.getDescription()} costs \$${coffee1.getCost()}');

  // Order 2: Coffee with milk
  Coffee coffee2 = Coffee(hasMilk: true);
  print('${coffee2.getDescription()} costs \$${coffee2.getCost()}');

  // Order 3: Coffee with milk and sugar
  Coffee coffee3 = Coffee(hasMilk: true, hasSugar: true);
  print('${coffee3.getDescription()} costs \$${coffee3.getCost()}');

  // What if we want to add new options like Chocolate or Cream later?
  // We'd need to:
  //  - Add new boolean fields (hasChocolate, hasCream)
  //  - Update description and cost logic
}
