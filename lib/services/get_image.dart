import 'package:daarul_ukhuwwah_media/model/api_model.dart';
import 'package:dio/dio.dart';

abstract class GetImage {
  static Future getData() async {
    try {
      var response = await Dio().get('https://dummyjson.com/products');
      if (response.statusCode == 200) {
        Map obj = response.data;
        return PostModel(
          images: obj['products'][0]['images'],
          title: obj['products'][0]['title'],
          desc: obj['products'][0]['description'],
        );
      }
      return null;
    } catch (e) {
      print('ini errornya : ' + e.toString());
      throw Exception(e.toString());
    }
  }
}
