// model
class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

// Container Item
class DeliveryBox {
  final String name;
  
  // 🔹 Problem 1: Different arrays for different types!
  // The Box must know the explicit difference between a single product 
  // and another box. This breaks uniformity.
  final List<Product> _products = [];
  final List<DeliveryBox> _smallerBoxes = [];

  DeliveryBox(this.name);

  void addProduct(Product product) {
    _products.add(product);
  }

  void addBox(DeliveryBox box) {
    _smallerBoxes.add(box);
  }

  // 🔹 Problem 2: Messy Calculation Logic
  // We have to manually calculate products, then loop through boxes.
  double calculateTotal() {
    double total = 0;
    
    // Calculate simple products
    for (var product in _products) {
      total += product.price;
    }
    
    // Calculate nested boxes
    for (var box in _smallerBoxes) {
      total += box.calculateTotal(); // At least we can use recursion here, but the code is still bloated.
    }
    
    return total;
  }

  // 🔹 Problem 3: Messy Display Logic
  // Any operation requires us to process products and boxes completely separately.
  void display() {
    print('📦 Box: $name');
    
    for (var product in _products) {
      print('  - ${product.name}: \$${product.price}');
    }
    
    for (var box in _smallerBoxes) {
      print('  [Contains nested ${box.name}]');
      // Proper indented display requires even more messy logic if not handled uniformly.
    }
  }
}
