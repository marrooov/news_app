import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/data/models/news_model.dart';
import 'package:news_app/features/home/data/repo/data_source/home_data_source_i9nterface.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
class HomeDataSourceImp implements HomeDataSourceInterface {
  @override
  Future<ResultApi<List<Article>>> getNews() async {
    try {
      Uri url = Uri.https('newsapi.org', '/v2/everything', {
        'q': 'bitcoin',
         'apiKey': '09338c5143bb43bd8d8e36226c4bd5c1'
         });
         var response = await http.get(url);
         String responseBody = response.body;
         var json = jsonDecode(responseBody);
         var data = NewsModel.fromJson(json);
         return Success<List<Article>>(data.articles ?? []);
    } on SocketException {
      return Error<List<Article>>('Failed to connect to the internet');}
     catch (e) {
      return Error<List<Article>>(e.toString()); // do not forget it!!
    }
  }

}