import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/domain/entities/news_entity.dart';

abstract interface class HomeRepoInterface {
  Future<ResultApi<NewsEntity>> getNews();
}