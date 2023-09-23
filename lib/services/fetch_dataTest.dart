import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/post_model.dart';

class ProductServicesTest {
  fetchData() async {
    final uri = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(uri);
    final jsonData = jsonDecode(response.body);
    List<dynamic> json = jsonData['products'];
    List<Product> results = [];
    if (response.statusCode == 200) {
      for (var i = 0; i < json.length; i++) {
        results.add(
          Product(
            id: json[i]['id'],
            title: json[i]['title'],
            description: json[i]['description'],
            price: json[i]['price'],
            discountPercentage: json[i]['discountPercentage'],
            rating: json[i]['rating']?.toDouble(),
            stock: json[i]['stock'],
            brand: json[i]['brand'],
            category: json[i]['category'],
            thumbnail: json[i]['thumbnail'],
            images: json[i]['images'],
          ),
        );
      }
      return results;
    }
  }
}
