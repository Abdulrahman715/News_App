import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:news_app/widgets/news_tile_skeleton.dart';
import 'package:news_app/widgets/sliver_future_builder.dart';

class NewsByCategoryListView extends StatefulWidget {
  const NewsByCategoryListView({super.key, required this.category});

  final String category;

  @override
  State<NewsByCategoryListView> createState() =>
      _NewsByCategoryListViewState();
}

class _NewsByCategoryListViewState extends State<NewsByCategoryListView> {
  late Future<List<ArticleModel>> futureNews;

  @override
  void initState() {
    super.initState();

    futureNews = NewsService(Dio())
        .getTopHeadlines(category: widget.category.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return SliverFutureBuilder<ArticleModel>(
      future: futureNews,
      skeleton: const NewsTileSkeleton(),
      itemBuilder: (article) => Padding(
        padding: const EdgeInsets.only(top: 32),
        child: NewsTile(news: article),
      ),
    );
  }
}
