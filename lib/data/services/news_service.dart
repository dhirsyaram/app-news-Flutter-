import 'dart:convert';
import 'package:app_news_flutter/data/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<NewsModel>> getNews() async {
    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=11c0e1e4e9864bcc89a9ace0efbe5227",
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List articles = data['articles'];
      return articles.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}
