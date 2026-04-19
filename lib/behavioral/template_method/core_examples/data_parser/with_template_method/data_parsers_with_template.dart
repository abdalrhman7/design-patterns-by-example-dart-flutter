
// Abstract Class: The "Template"
abstract class DataParser {
  // 🔹 The Template Method
  // This defines the skeleton of the algorithm.

 void parseData() {
    openFile();
    extractData();
    
    // 🔹 Using a Hook
    // Subclasses can choose to override this or use the default behavior.
    if (shouldValidate()) {
      print('Validating extracted data...');
    }
    
    processData();
    closeFile();
  }

  // 🔹 Common Step (Implemented in Base Class)
  void openFile() {
    print('Opening file for reading...');
  }

  // 🔹 Abstract Step (MUST be implemented by subclasses)
  // This is the "variant" part of the algorithm.
  void extractData();

  // 🔹 Common Step (Implemented in Base Class)
  void processData() {
    print('Processing data into domain models...');
  }

  // 🔹 Common Step (Implemented in Base Class)
  void closeFile() {
    print('Closing file and releasing resources...');
  }

  // 🔹 A Hook
  // Default is true, but individual parsers can disable it.
  bool shouldValidate() => true;
}

// Concrete Class 1: CSV Implementation
class CSVParser extends DataParser {
  @override
  void extractData() {
    print('Extracting data from CSV rows...');
  }
}

// Concrete Class 2: JSON Implementation
class JSONParser extends DataParser {
  @override
  void extractData() {
    print('Extracting data from JSON objects...');
  }

  // 🔹 Overriding a Hook
  // We decide JSON files don't need validation for this example.
  @override
  bool shouldValidate() => false;
}

// ✅ Key Advantages in Action:

// 1. Code Reusability: 
// The logic for opening, processing, and closing the file is written ONCE in the base class.

// 2. Controlled Extension: 
// Subclasses ONLY need to implement what is truly different (extractData).

// 3. Encapsulation of Structure: 
// The order of execution (the algorithm) is protected in 'parseData()'.

// 4. Flexibile via Hooks: 
// JSONParser can easily skip the validation step without changing the algorithm's flow.
