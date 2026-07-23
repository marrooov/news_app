import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/domain/entities/news_entity.dart' show NewsEntity;

abstract interface class HomeDataSourceInterface {
  Future<ResultApi<NewsEntity>> getNews();
}