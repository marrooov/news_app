import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/data/models/news_model.dart';

abstract class Api{
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=09338c5143bb43bd8d8e36226c4bd5c1
  static Future<ResultApi<NewsModel>> getNews() async {
    try {
      Uri url = Uri.https('newsapi.org', '/v2/everything', {
        'q': 'bitcoin',
         'apiKey': '09338c5143bb43bd8d8e36226c4bd5c1'
         });
         var response = await http.get(url);
         String responseBody = response.body;
         var json = jsonDecode(responseBody);
         var data = NewsModel.fromJson(json);
         return Success<NewsModel>(data);
    } on SocketException {
      return Error<NewsModel>('Failed to connect to the internet');}
     catch (e) {
      return Error<NewsModel>(e.toString()); // do not forget it!!
    }
  }
}