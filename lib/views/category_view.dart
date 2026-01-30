import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_by_category_list_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: Text(category,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            NewsByCategoryListView(category: category),
          ],
        ),
      ),
    );
  }
}
