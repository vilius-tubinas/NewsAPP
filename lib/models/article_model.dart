import 'package:visma_app/models/source_model.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    //We have to check that the json we get doesnt give null values
    List<String> checker = [
      'source',
      'author',
      'title',
      'description',
      'url',
      'urlToImage',
      'publishedAt',
      'content'
    ];

    //Making sure that null is not passed to avoid errors
    for (int i = 0; i < 8; i++) {
      if (json[checker[i]] == null) {
        if (checker[i] == 'urlToImage') {
          json[checker[i]] =
              "https://uning.es/wp-content/uploads/2016/08/ef3-placeholder-image.jpg";
        } else {
          json[checker[i]] = "Not given";
        }
      }
    }

    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }
}
