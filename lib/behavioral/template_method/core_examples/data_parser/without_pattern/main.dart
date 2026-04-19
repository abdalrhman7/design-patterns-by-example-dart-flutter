import 'data_parsers_without_pattern.dart';

void main() {
  print('\n[Testing CSV Parser]');
  final csvParser = CSVParser();
  csvParser.parseData();

  print('\n[Testing JSON Parser]');
  final jsonParser = JSONParser();
  jsonParser.parseData();
}
