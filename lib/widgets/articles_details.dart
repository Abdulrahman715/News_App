import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesDetails extends StatelessWidget {
  final ArticleModel article;

  const ArticlesDetails({super.key, required this.article});

  Future<void> openArticleUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            article.image ?? "", // variable
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/general.webp",
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),

        SizedBox(height: 12),

        Text(
          "Author : ${article.author}",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 12),

        Text(
          article.title, // variable
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
          article.subTitle ?? " ", // variable
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 12),

        Text(
          article.content ?? "",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),

        SizedBox(height: 18),

        TextButton.icon(
          onPressed: () {
            if (article.url != null) {
              openArticleUrl(article.url!);
            }
          },
          icon: const Icon(
            Icons.arrow_forward_ios, // أيقونة السهم
            size: 16,
            color: Colors.blueAccent, // لون الأيقونة
          ),
          label: const Text(
            'Read Full Article',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueAccent, // لون النص
              fontWeight: FontWeight.bold,
            ),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero, // عشان ميبقاش فيه مسافات فاضية من الجنب
          ),
        ),

        // GestureDetector(
        //   onTap: () {
        //     openArticleUrl(article.url!);
        //   },
        //   child: const Text(
        //     'Open the full article in browser',
        //     style: TextStyle(
        //       color: Colors.blue,
        //       decoration: TextDecoration.underline,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
