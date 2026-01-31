//!الجزء (1) :  Widget  عملنا عام

import 'package:flutter/cupertino.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SliverFutureBuilder<T> extends StatelessWidget {
  final Future<List<T>> future;
  final int skeletonCount;
  final Widget Function(T item) itemBuilder;
  final Widget skeleton;

  const SliverFutureBuilder({
    super.key,
    required this.future,
    required this.itemBuilder,
    required this.skeleton,
    this.skeletonCount = 6,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<T>>(
      future: future,
      builder: (context, snapshot) {
        /// 🟡 Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverSkeletonizer(
            enabled: true,
            child: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: skeletonCount,
                (context, index) => skeleton,
              ),
            ),
          );
        }

        /// 🔴 Error
        if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(child: Text('Something went wrong')),
          );
        }

        /// 🟢 Data
        final items = snapshot.data!;

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: items.length,
            (context, index) => itemBuilder(items[index]),
          ),
        );
      },
    );
  }
}
