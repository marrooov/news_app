import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/data/models/news_model.dart';
import 'package:news_app/features/home/data/repo/data_source/home_data_source_i9nterface.dart';
import 'package:news_app/features/home/data/repo/repo/home_repo_interface.dart';

class HomeRepoImp implements HomeRepoInterface {
  final HomeDataSourceInterface _DataSource;

  HomeRepoImp(this._DataSource);

  @override
  Future<ResultApi<List<Article>>> getNews() async {
    final result = await _DataSource.getNews();
    switch (result) {
      case Success<List<Article>>():
        return Success(result.data!);
      case Error<List<Article>>(:final messageError):
        return Error<List<Article>>(messageError);
    }
  }
}