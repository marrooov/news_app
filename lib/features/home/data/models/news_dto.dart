import 'package:news_app/features/home/domain/entities/news_entity.dart';

class NewsDto {
  String? status;
  int? totalResults;
  List<ArticleDto>? articles;

  NewsDto({this.status, this.totalResults, this.articles});

  NewsDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles =[];
      json['articles'].forEach((v) {
        articles!.add(ArticleDto.fromJson(v));
      });
    }
  }
  NewsEntity toEntity() {
    return NewsEntity(
      status: status ?? 'error',
      totalResults: totalResults ?? 0,
      articles: articles?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

class ArticleDto {

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;

  String? content;

  ArticleDto(
      {
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,

      this.content});

  ArticleDto.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    content = json['content'];
  }
  ArticleEntity toEntity() {
    return ArticleEntity(
      author: author ?? '',
      title: title ?? '',
      description: description ?? '',
      url: url ?? '',
      urlToImage: urlToImage ?? '',
    );
}
}