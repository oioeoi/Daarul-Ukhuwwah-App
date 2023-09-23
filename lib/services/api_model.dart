import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductServices {
  fetchData() async {
    final url = 'https://dummyjson.com/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    if (response.statusCode == 200) {
      final data = json['products'];
      return data;
    }
  }
}
