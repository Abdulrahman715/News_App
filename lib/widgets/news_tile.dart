import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
// import 'package:news_app/models/news_tile_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.news});

  final ArticleModel news;

  //cashed network image 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            news.image ?? "", // variable
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset("assets/images/general.webp", fit: BoxFit.cover , width: double.infinity,);
            },
          ),
        ),


        SizedBox(height: 12),

        Text(
          news.title, // variable
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 12),

        Text(
          news.subTitle ?? " ", // variable
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
