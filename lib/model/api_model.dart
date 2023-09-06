class PostModel {
  PostModel({
    required this.images,
    this.title,
    this.desc,
  });

  List images;
  String? title;
  String? desc;

  static PostModel fromJson(Map json) {
    return PostModel(
      images: json['products'],
      title: json['products'],
      desc: json['products'],
    );
  }
}
