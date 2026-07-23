import 'package:news_app/features/home/domain/entities/news_entity.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  List<ArticleEntity> articles;
  HomeSuccess(this.articles);
}

class HomeError extends HomeState {
  String? messageError;
  HomeError(this.messageError);
}