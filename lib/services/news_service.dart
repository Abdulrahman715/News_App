import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=dd2c505063524f79a0cb786e0d0116da&category=$category',
      );

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var element in articles) {
        ArticleModel articleMapToObj = ArticleModel(
          title: element['title'] ?? 'No title',
          subTitle: element['description'],
          image: element['urlToImage'],
          content: element['content'],
          author: element['author'],
          sourceName: element['source']['name'],
          publishedAt: element['publishedAt'],
          url: element['url'],
        );

        articlesList.add(articleMapToObj);
      }

      return articlesList;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('الإنترنت بطيء');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception('مفيش اتصال بالإنترنت');
      } else {
        throw Exception('حصل خطأ غير متوقع');
      }
    }
  }
}
