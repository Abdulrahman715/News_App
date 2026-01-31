class ArticleModel {
  final String title;
  final String? subTitle;
  final String? image;
  final String? content;
  final String? author;
  final String? sourceName;
  final String? publishedAt;
  final String? url;

  ArticleModel({
    required this.title,
    this.subTitle,
    this.image,
    this.content,
    this.author,
    this.sourceName,
    this.publishedAt,
    this.url,
  });
}

// class ArticleModel {
//   final String? image;
//   final String title;
//   final String? subTitle;
//   // final Source source;

//   ArticleModel({
//     this.image,
//     required this.title,
//     this.subTitle,
//     // required this.source,
//   });
// }

// // class Source {
// //   final String id;
// //   final String name;

// //   Source({required this.id, required this.name});
// // }
