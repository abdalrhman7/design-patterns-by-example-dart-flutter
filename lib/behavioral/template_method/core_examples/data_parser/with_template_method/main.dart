import 'data_parsers_with_template.dart';

void main() {
  print('\n[Testing CSV Parser (Hooks: ON)]');
  final csvParser = CSVParser();
  csvParser.parseData();

  print('\n-----------------------------------');

  print('\n[Testing JSON Parser (Hooks: OFF)]');
  final jsonParser = JSONParser();
  jsonParser.parseData();
}
