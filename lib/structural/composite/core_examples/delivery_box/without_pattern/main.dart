import 'delivery_without_composite.dart';

void main() {
  print('=============================================');
  print('  COMPOSITE - WITHOUT PATTERN                ');
  print('=============================================\n');

  // Setup simple products
  final phone = Product('Smartphone', 1000);
  final charger = Product('Charger', 50);
  final earbuds = Product('Wireless Earbuds', 150);

  // Setup receipt (leaf item outside any box)
  final receipt = Product('Paper Receipt', 0);

  // Setup nested boxes
  final electronicsBox = DeliveryBox('Electronics Box');
  electronicsBox.addProduct(phone);
  electronicsBox.addProduct(charger);

  final mainDeliveryBox = DeliveryBox('Main Order Box');

  // 🔹 The client has to explicitly call different methods for different object types!
  mainDeliveryBox.addBox(electronicsBox); // Method 1 for groups
  mainDeliveryBox.addProduct(earbuds); // Method 2 for single items
  mainDeliveryBox.addProduct(receipt); // Method 2 for single items

  // Calculating total
  final total = mainDeliveryBox.calculateTotal();
  print('Total Order Price: \$$total');
  print('\nBox Structure:');
  mainDeliveryBox.display();

  print('\n=============================================');
}
