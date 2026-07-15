import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/models/news_model.dart';

abstract class Api{
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=09338c5143bb43bd8d8e36226c4bd5c1
  static Future<NewsModel> getNews() async {
    Uri url = Uri.https('newsapi.org', '/v2/everything', {
      'q': 'bitcoin',
       'apiKey': '09338c5143bb43bd8d8e36226c4bd5c1'
       });
       var response = await http.get(url);
       String responseBody = response.body;
       var json = jsonDecode(responseBody);
       return NewsModel.fromJson(json);
  }
}