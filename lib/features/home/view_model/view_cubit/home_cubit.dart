import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/data/api/api.dart';
import 'package:news_app/features/home/data/models/news_model.dart';
import 'package:news_app/features/home/view_model/view_cubit/home_state.dart';

 class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> intent(HomeIntent intent) async {
   switch (intent) {
      case FetchHomeIntent():
        await fetchNews(intent.id);
      case FetchSourceIntent():
        await _getSource();
    }
  }

  Future<void> fetchNews(String id) async {
    emit(HomeLoading());
    var result = await Api.getNews();
    switch (result) {
      case Success<NewsModel>():
        emit(HomeSuccess(result.data?.articles ?? []));
        break;
      case Error<NewsModel>():
        emit(HomeError(result.messageError));
        break;
    }
  }
  Future<void> _getSource() async {}
}

sealed class HomeIntent {}

class FetchHomeIntent extends HomeIntent {
  String id;
  FetchHomeIntent(this.id);
}

class FetchSourceIntent extends HomeIntent {}