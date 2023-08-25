import 'package:daarul_ukhuwwah_media/model/img_movie.dart';
import 'package:dio/dio.dart';

abstract class Services {
  static Future getId(number) async {
    var headers = {
      "accept": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNWQ5M2E5NzJhOWVkN2Q5YjE2Nzg5YjQ0Yzk2YmQ5MiIsInN1YiI6IjY0ZTZjM2M1MWZlYWMxMDExYjJjNDU1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cTbEBB4thKu85sggChXnEzKGlEbDfzGVHqrU6jCFyno"
    };

    var url =
        Uri.parse('https://api.themoviedb.org/3/account/20191650/lists?page=1');
    try {
      var response = await Dio().get(
          'https://api.themoviedb.org/3/movie/157336?api_key=d5d93a972a9ed7d9b16789b44c96bd92');
      if (response.statusCode == 200)
        return Movie(
            id: response.data['results']['original_title'],
            item: response.data['results']['poster_path']);
      print(response.data);
    } catch (e) {
      print('ini errornya : ' + e.toString());
    }
  }

  static Future getImage(id) async {}
}
//157336?api_key=d5d93a972a9ed7d9b16789b44c96bd92
// d5d93a972a9ed7d9b16789b44c96bd92