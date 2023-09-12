import 'dart:convert';

import 'package:http/http.dart' as http;

class PostModel {
  List images;
  String? title;
  String? desc;

  PostModel({
    required this.images,
    this.title,
    this.desc,
  });

  factory PostModel.fromJson(Map json) {
    return PostModel(
      images: json['products'],
      title: json['products'],
      desc: json['products'],
    );
  }
}

class ImageServices {
  Future<List<PostModel>> getImageData() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products "),
    );
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception('HTTP Failed');
    }
// return Map obj = jsonDecode(response.body);
  }
}
