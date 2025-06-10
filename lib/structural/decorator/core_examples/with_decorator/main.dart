import 'coffee_decorator.dart';

void main() {
  // Example 1
  // Step 1: Start with a simple coffee
  Coffee coffee = SimpleCoffee();
  print('${coffee.getDescription()} costs \$${coffee.getCost()}');

  // Step 2: Add milk dynamically
  coffee = MilkDecorator(coffee);
  print('${coffee.getDescription()} costs \$${coffee.getCost()}');

  // Step 3: Add sugar dynamically
  coffee = SugarDecorator(coffee);
  print('${coffee.getDescription()} costs \$${coffee.getCost()}');

  // ===================================================================

  // Example 2
  // Step 1: Start with a simple coffee
  Coffee espresso = Espresso();
  print('${espresso.getDescription()} costs \$${espresso.getCost()}');

  // Step 2: Add milk dynamically
  espresso = MilkDecorator(espresso);
  print('${espresso.getDescription()} costs \$${espresso.getCost()}');

  // Step 3: Add sugar dynamically
  espresso = SugarDecorator(espresso);
  print('${espresso.getDescription()} costs \$${espresso.getCost()}');
}
