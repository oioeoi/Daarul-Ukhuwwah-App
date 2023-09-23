import 'package:daarul_ukhuwwah_media/model/post_model.dart';

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
}
