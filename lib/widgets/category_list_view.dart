import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(
      categoryName: 'Business',
      image: 'assets/images/business.webp',
    ),
    CategoryModel(
      categoryName: 'Entertainment',
      image: 'assets/images/entertainment.webp',
    ),
    CategoryModel(categoryName: 'General', image: 'assets/images/general.webp'),
    CategoryModel(categoryName: 'Health', image: 'assets/images/health.webp'),
    CategoryModel(categoryName: 'Science', image: 'assets/images/science.webp'),
    CategoryModel(categoryName: 'Sports', image: 'assets/images/sports.webp'),
    CategoryModel(
      categoryName: 'Technology',
      image: 'assets/images/technology.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
