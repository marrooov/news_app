import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/data/models/news_model.dart';

abstract interface class HomeRepoInterface {
  Future<ResultApi<List<Article>>> getNews();
}