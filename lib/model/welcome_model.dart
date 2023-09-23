import 'dart:convert';

import 'package:daarul_ukhuwwah_media/model/post_model.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Product> products;
  int total;
  int skip;
  int limit;

  Welcome({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}
