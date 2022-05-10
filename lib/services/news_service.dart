import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:visma_app/models/article_model.dart';

Future<List<Article>> updateHeadlines(String? category) async {
  String endPointUrl = "newsapi.org";
  var client = http.Client();
  var queryParameters = {
    'apiKey': '23a381f95b8e4e6e8f03d413f5a88282',
    'language': 'en'
  };

  if (category != null) {
    queryParameters = {
      'apiKey': '23a381f95b8e4e6e8f03d413f5a88282',
      'language': 'en',
      'category': category,
    };
  } else {
    queryParameters = {
      'apiKey': '23a381f95b8e4e6e8f03d413f5a88282',
      'language': 'en'
    };
  }

  final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
  final response = await client.get(uri);
  Map<String, dynamic> json = jsonDecode(response.body);
  List<dynamic> body = json['articles'];
  List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();
  return articles;
}
