import 'package:http/http.dart' as http;

import '../model/article_model.dart';

class ApiService {
  final String _baseUrl = "https://newsapi.org/v2";
  final String apiKeys = "d7c309664c1246c092fc518a46ed4dbd";

  Future<ArticleModel> getArticle(String? category) async {
    final response = await http.get(Uri.parse(
        "$_baseUrl/top-headlines?apiKey=$apiKeys&country=id&category=$category"));
    if (response.statusCode == 200) {
      return articleModelFromJson(response.body);
    } else {
      throw Exception('Failed to load article');
    }
  }
}
