import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/domain/entities/news_entity.dart';
import 'package:news_app/features/home/domain/repo/home_data_source_interface.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/features/home/data/models/news_dto.dart';
class HomeDataSourceImp implements HomeDataSourceInterface {
  @override
  Future<ResultApi<NewsEntity>> getNews() async {
    try {
      Uri url = Uri.https('newsapi.org', '/v2/everything', {
        'q': 'bitcoin',
         'apiKey': '09338c5143bb43bd8d8e36226c4bd5c1'
         });
         var response = await http.get(url);
         String responseBody = response.body;
         var json = jsonDecode(responseBody);
         var data = NewsDto.fromJson(json);
         return Success<NewsEntity>(data.toEntity());
    } on SocketException {
      return Error<NewsEntity>('Failed to connect to the internet');}
     catch (e) {
      return Error<NewsEntity>(e.toString()); // do not forget it!!
    }
}
}