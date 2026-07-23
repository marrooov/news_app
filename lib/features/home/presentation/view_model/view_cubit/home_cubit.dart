import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/domain/entities/news_entity.dart';
import 'package:news_app/features/home/domain/use_case/get_news_use_case.dart';
import 'package:news_app/features/home/presentation/view_model/view_cubit/home_state.dart';

 class HomeCubit extends Cubit<HomeState> {
  HomeCubit( this._getNewsUseCase) : super(HomeInitial());
  final GetNewsUseCase _getNewsUseCase;

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
    var result = await _getNewsUseCase.invoke();
  switch (result) {
      case Success<NewsEntity>():
        emit(HomeSuccess(result.data.articles));
      case Error<NewsEntity>():
        emit(HomeError(result.messageError));
    }
  }
}
  Future<void> _getSource() async {}

sealed class HomeIntent {}

class FetchHomeIntent extends HomeIntent {
  String id;
  FetchHomeIntent(this.id);
}

class FetchSourceIntent extends HomeIntent {}