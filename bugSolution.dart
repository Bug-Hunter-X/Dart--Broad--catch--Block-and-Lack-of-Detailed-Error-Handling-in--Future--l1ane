```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        final String name = jsonData['name'];
        print('Name: $name');
      } on FormatException catch (e) {
        print('Error: Invalid JSON format: $e');
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } on http.ClientException catch (e) {
    print('Network Error: $e');
  } catch (e, stacktrace) {
    print('An unexpected error occurred: $e');
    print('Stacktrace: $stacktrace');
  }
}
```