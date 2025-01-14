```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      // Access data. Note this assumes a specific structure
      final String name = jsonData['name'];
      //Further processing of jsonData
      print('Name: $name');
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle the error appropriately
    print('Error: $e');
    // Consider logging errors with stacktraces for better debugging
  }
}
```