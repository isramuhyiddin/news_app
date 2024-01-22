import 'package:flutter/material.dart';
import 'package:news_app_isra/services/api_service.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({this.category, super.key});
  final String? category;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: FutureBuilder(
        future: apiService.getArticle(widget.category),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data.articles[index].title),
                  subtitle: Text(snapshot.data.articles[index].author),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}