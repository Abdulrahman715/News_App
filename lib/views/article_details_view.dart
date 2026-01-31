import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/articles_details.dart';
// import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsView extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetailsView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          article.sourceName ?? 'News',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ArticlesDetails(article: article),
      ),
    );
  }
}
