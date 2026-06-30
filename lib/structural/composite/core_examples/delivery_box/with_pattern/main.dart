import 'delivery_with_composite.dart';

void main() {
  print('=============================================');
  print('  COMPOSITE - WITH PATTERN                   ');
  print('=============================================\n');

  // Setup simple products (Leaves)
  final phone = Product('Smartphone', 1000);
  final charger = Product('Charger', 50);
  final earbuds = Product('Wireless Earbuds', 150);
  final receipt = Product('Paper Receipt', 0);

  // Setup nested Box (Composite)
  final electronicsBox = DeliveryBox('Electronics Box');
  electronicsBox.add(phone);
  electronicsBox.add(charger);

  // Setup Main Order Box (Composite)
  final mainDeliveryBox = DeliveryBox('Main Order Box');

  // 🔹 Notice the incredible Uniformity!
  // The client calls exactly the same method `.add()` whether they are adding
  // a simple product or an entire complex branch of products!
  mainDeliveryBox.add(electronicsBox);
  mainDeliveryBox.add(earbuds);
  mainDeliveryBox.add(receipt);

  // 🔹 The client doesn't need to know the tree depth or use complex loops.
  // The call is completely abstracted.
  final total = mainDeliveryBox.getPrice();
  print('Total Order Price: \$$total');

  print('\nBox Structure:');
  mainDeliveryBox.display();

  print('\n-------------------');
  // We can even treat single items identically!
  print('Single item price test: \$${earbuds.getPrice()}');

  print('\n=============================================');
}
