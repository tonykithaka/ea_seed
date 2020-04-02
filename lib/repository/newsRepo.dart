import 'dart:convert';

import 'package:ea_seed/model/news.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class NewsRepo {
  Future FetchNews() async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    final response =
        await http.get("http://68.183.101.224/api/publications", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      List<News> newsList = (json.decode(response.body) as List)
          .map((i) => News.fromJson(i))
          .toList();
      return newsList;
    } else {
      print(json.decode(response.body));
    }
  }

  Future FetchNewsDetails(String newsId) async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    final response = await http
        .get("http://68.183.101.224/api/publications/$newsId", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      Map newsResponse = json.decode(response.body);
      var newsDetails = News(
          status: newsResponse["status"],
          title: newsResponse["title"],
          photo: newsResponse["photo"],
          body: newsResponse["body"],
          created_at: newsResponse["created_at"]);
      return newsDetails;
    } else {
      print(json.decode(response.body));
    }
  }
}
