import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
// import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:news_app/widgets/news_tile_skeleton.dart';
import 'package:news_app/widgets/sliver_future_builder.dart';
// import 'package:skeletonizer/skeletonizer.dart';

class NewsTileListView extends StatefulWidget {
  const NewsTileListView({super.key});

  @override
  State<NewsTileListView> createState() => _NewsTileListViewState();
}

class _NewsTileListViewState extends State<NewsTileListView> {
  late Future<List<ArticleModel>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = NewsService(Dio()).getTopHeadlines(category: 'general');
  }

  @override
  Widget build(BuildContext context) {
    return SliverFutureBuilder<ArticleModel>(
      future: futureNews,
      skeleton: NewsTileSkeleton(),
      itemBuilder: (articles) => Padding(
        padding: const EdgeInsets.only(top: 32),
        child: NewsTile(news: articles),
      ),
    );
  }
}




//! ده بقى الحل النضيف للمشاريع الكبيرة انما احنا مشروع صغير وليه ودجت جاهزة هستخدمها فوق 

// class NewsTileListView extends StatefulWidget {
//   const NewsTileListView({super.key});

//   @override
//   State<NewsTileListView> createState() => _NewsTileListViewState();
// }

// class _NewsTileListViewState extends State<NewsTileListView> {
//   List<ArticleModel> articles = [];

//   bool isLoading = true; //! data is loading

//   @override
//   void initState() {
//     super.initState();
//     getNews();
//   }

//   Future<void> getNews() async {
//     articles = await NewsService(Dio()).getGeneralNews();
//     isLoading = false; //Todo (Data Loaded)
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SliverSkeletonizer(   
//       enabled: isLoading,
//       child: SliverList(
//         delegate: SliverChildBuilderDelegate(
//           childCount: isLoading ? 6 : articles.length,
//           (context, index) {
//             final article = isLoading
//                 ? ArticleModel(
//                     title: "Loading ....",
//                     subTitle: 'Loading ...',
//                     image: "",
//                   )
//                 : articles[index];

//             return Padding(
//               padding: const EdgeInsets.only(top: 32),
//               child: NewsTile(news: article),
//             );
//           },
//         ),
//       ),
//     );
//   }


// }

//todo if you want to build fack ui loading in the top of screen
// return isLoading
// /         ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
//         : SliverList(

//! if you want the loading mark in the center

// @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return SliverToBoxAdapter(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height * 0.7,
//           child: Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//       );
//     }

//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         childCount: articles.length,
//         (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 32),
//             child: NewsTile(news: articles[index]),
//           );
//         },
//       ),
//     );
//   }

//! if you want to make the articles skeleton

// @override
//   Widget build(BuildContext context) {
//     return SliverSkeletonizer(   
//       enabled: isLoading,
//       child: SliverList(
//         delegate: SliverChildBuilderDelegate(
//           childCount: isLoading ? 6 : articles.length,
//           (context, index) {
//             final article = isLoading
//                 ? ArticleModel(
//                     title: "Loading ....",
//                     subTitle: 'Loading ...',
//                     image: "",
//                   )
//                 : articles[index];

//             return Padding(
//               padding: const EdgeInsets.only(top: 32),
//               child: NewsTile(news: article),
//             );
//           },
//         ),
//       ),
//     );
//   }
