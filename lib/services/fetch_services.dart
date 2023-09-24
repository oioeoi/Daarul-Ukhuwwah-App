import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post_model.dart';

class ProductServices {
  fetchData() async {
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

    // fetchData() async {
    //   final uri = Uri.parse('https://dummyjson.com/products');
    //   final response = await http.get(uri);
    //   final json = jsonDecode(response.body);
    //   final result = json['products'];
    //   final List<Product> data = [];
    //   (response.statusCode == 200)
    //       ? (
    // result.map((e) {
    //   data.add(
    //     Product(
    //       id: e['id'],
    //       title: e['title'],
    //       description: e['description'],
    //       price: e['price'],
    //       discountPercentage: e['discountPercentage'],
    //       rating: e['rating']?.toDouble(),
    //       stock: e['stock'],
    //       brand: e['brand'],
    //       category: e['category'],
    //       thumbnail: e['thumbnail'],
    //       images: e['images'],
    //     ),
    //   );
    // }).toList(),
    //           Product.fromJson(json)
    //         )
    //       : data;
    //   return data;
  }
}
