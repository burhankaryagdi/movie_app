import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/model/home_model.dart';

class HomeViewModel {
  final String url = "https://www.apirequest.in/movie/api";

  Future<List<HomeModel>?> fetchMovie() async {
    Uri uri = Uri.parse(url);
    var res = await http.get(uri);

    if (res.statusCode == 200 || res.statusCode == 201) {
      List<dynamic> jsonBody = jsonDecode(res.body);
      return jsonBody.map((movie) => HomeModel.fromJson(movie)).toList();
    } else {
      print("Error: ${res.statusCode}");
    }
    return null;
  }
}
