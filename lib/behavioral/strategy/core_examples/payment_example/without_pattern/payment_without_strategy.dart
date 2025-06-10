class ShoppingCart {
  String paymentMethod = 'credit_card'; // Hardcoded method selection using a string

  void setPaymentMethod(String method) {
    paymentMethod = method;
  }

  void checkout(double amount) {
    // Problem 1: Using conditional logic to choose behavior
    // This violates the Open/Closed Principle (OCP):
    // We must modify this method to support a new payment type
    if (paymentMethod == 'credit_card') {
      print('Paid $amount using Credit Card');
    } else if (paymentMethod == 'paypal') {
      print('Paid $amount using PayPal');
    } else {
      print('Payment method not supported');
    }

    // Problem 2: Tight coupling between payment methods and the ShoppingCart
    // Any change to payment logic forces changes in this class
    // Making the code less maintainable and harder to test
  }
}


