class CSVParser {
  void parseData() {
    print('Opening CSV file...'); // Duplicated logic
    print('Extracting data from CSV rows...'); // Specific logic
    print('Processing data...'); // Duplicated logic
    print('Closing CSV file...'); // Duplicated logic
  }
}

class JSONParser {
  void parseData() {
    print('Opening JSON file...'); // Duplicated logic
    print('Extracting data from JSON objects...'); // Specific logic
    print('Processing data...'); // Duplicated logic
    print('Closing JSON file...'); // Duplicated logic
  }
}

// Problem 1: Code Duplication
// The logic for opening, processing, and closing the file is copied across multiple classes.
// If the "Processing" logic changes, you have to update it in every single parser class.

// Problem 2: Lack of Structure
// There is no enforcement of the steps. One developer might forget to "Close" the file
// or change the order of steps accidentally.
