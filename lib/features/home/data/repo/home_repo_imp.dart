import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/data/repo/home_data_source_imp.dart';
import 'package:news_app/features/home/domain/entities/news_entity.dart';
import 'package:news_app/features/home/domain/repo/home_data_source_interface.dart';
import 'package:news_app/features/home/domain/repo/home_repo_interface.dart';

class HomeRepoImp implements HomeRepoInterface{
  final HomeDataSourceInterface _dataSource;
  HomeRepoImp(this._dataSource);
  @override
  Future<ResultApi<NewsEntity>> getNews() async => await _dataSource.getNews();
}


HomeRepoInterface homeRepoImpInjectable() => 
  HomeRepoImp(homeDataSourceImpInjectable());