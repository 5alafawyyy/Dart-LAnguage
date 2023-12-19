import 'package:flutter/material.dart';

import 'featured_books_list_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0),
      height: MediaQuery.sizeOf(context).height * 0.32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FeaturedBooksListViewItem(
              assetName: 'assets/images/book_${index + 1}.png',
              aspectRatio: (index == 0) ? 2.2 / 3 : 2 / 3,
              padding: (index == 0) ? 0.0 : 10,
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
