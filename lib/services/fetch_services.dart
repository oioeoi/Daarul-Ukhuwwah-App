import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post_model.dart';

class ProductServices {
  Future fetchData() async {
    final uri = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final List result = json['products'];
    final List<Product> data = [];

    if (response.statusCode == 200) {
      for (var i = 0; i < result.length; i++) {
        data.add(Product.fromJson(result[i]));
      }
      return data;
    }
  }
}
