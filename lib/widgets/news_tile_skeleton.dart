import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsTileSkeleton extends StatelessWidget {
  const NewsTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: NewsTile(
        news: ArticleModel(
          title: "Loading ... ",
          subTitle: "Loading ... ",
          image: "",
        ),
      ),
    );
  }
}
