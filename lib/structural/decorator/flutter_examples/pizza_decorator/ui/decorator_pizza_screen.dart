import 'package:flutter/material.dart';
import '../pizza_decorator.dart';

class DecoratorPizzaScreen extends StatefulWidget {
  const DecoratorPizzaScreen({super.key});

  @override
  State<DecoratorPizzaScreen> createState() => _DecoratorPizzaScreenState();
}

class _DecoratorPizzaScreenState extends State<DecoratorPizzaScreen> {
  bool hasSauce = false;
  bool hasMozzarella = false;
  bool hasMushroom = false;
  bool hasPepperoni = false;

  Pizza _buildPizza() {
    Pizza pizza = const PizzaBase("Custom Pizza");
    if (hasSauce) pizza = Sauce(pizza);
    if (hasMozzarella) pizza = Mozzarella(pizza);
    if (hasMushroom) pizza = Mushroom(pizza);
    if (hasPepperoni) pizza = Pepperoni(pizza);
    return pizza;
  }

  @override
  Widget build(BuildContext context) {
    final pizza = _buildPizza();

    return Scaffold(
      appBar: AppBar(title: const Text('Decorator Pattern - Pizza')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Toppings:", style: TextStyle(fontSize: 18)),
            CheckboxListTile(
              title: const Text("Sauce"),
              value: hasSauce,
              onChanged: (val) {
                setState(() {
                  hasSauce = val!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Mozzarella"),
              value: hasMozzarella,
              onChanged: (val) {
                setState(() {
                  hasMozzarella = val!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Mushroom"),
              value: hasMushroom,
              onChanged: (val) {
                setState(() {
                  hasMushroom = val!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Pepperoni"),
              value: hasPepperoni,
              onChanged: (val) => setState(() => hasPepperoni = val!),
            ),
            const SizedBox(height: 24),
            const Text("Pizza Summary:", style: TextStyle(fontSize: 18)),
            Text(pizza.getDescription(), style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            Text("Total Price: \$${pizza.getPrice().toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
