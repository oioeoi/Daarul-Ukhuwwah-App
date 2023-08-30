import 'package:dio/dio.dart';

abstract class GetImage {
  bool _isLoading = true;
  List<Map<String, dynamic>> products = [];

  Future getData() async {
    var url = 'https://dummyjson.com/products';
    try {
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        // products berbentuk list of map
        products = List<Map<String, dynamic>>.from(response.data['products']);
        _isLoading = false;
      }
    } catch (e) {
      print('ini errornya : ' + e.toString());
    }
  }
}
