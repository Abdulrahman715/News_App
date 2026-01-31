import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view.dart';
import 'package:news_app/widgets/category_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'News',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: 'Cloud',
                style: TextStyle(color: Colors.orangeAccent),
              ),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryListView()),
            SliverToBoxAdapter(child: SizedBox(height: 22)),
            NewsTileListView(),
          ],
        ),
      ),
    );
  }
}
