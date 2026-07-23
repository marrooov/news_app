import 'package:news_app/features/home/presentation/view/screens/home_screen.dart';

class NewsEntity {
  String status;
  int totalResults;
  List<ArticleEntity> articles;

  NewsEntity(
    {this.status = 'error',
     this.totalResults = 0,
      this.articles = const []
      });

}

class ArticleEntity {

  String author;
  String title;
  String description;
  String url;
  String urlToImage;

  ArticleEntity(
      {
      this.author = 'Marwan',
      this.title = 'Default Title',
      this.description = 'Default Description',
      this.url = 'Default URL',
      this.urlToImage = dummyImage,
      });
}
