import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/data/api/api.dart';
import 'package:news_app/features/home/data/models/news_model.dart';
import 'package:news_app/features/home/view_model/view_cubit/home_state.dart';

 class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void fetchNews() async {
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
}