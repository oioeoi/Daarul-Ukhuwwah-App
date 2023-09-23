import 'dart:convert';

List<Product> productFromJson(dynamic str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

class Product {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List images;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(
          json["images"].map(
            (x) => x,
          ),
        ),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(
          images.map(
            (x) => x,
          ),
        ),
      };
}
