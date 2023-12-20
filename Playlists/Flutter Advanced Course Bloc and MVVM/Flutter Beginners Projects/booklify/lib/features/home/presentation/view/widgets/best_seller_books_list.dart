import 'package:flutter/material.dart';

import 'best_seller_books_list_item.dart';

class BestSellerBooksList extends StatelessWidget {
  const BestSellerBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView.builder(
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return BestSellerBooksListItem(
            assetName: dummyData[index].assetName,
            titleText: dummyData[index].titleText,
            auther: dummyData[index].auther,
            price: dummyData[index].price,
            rate: dummyData[index].rate,
            noOfPeopleWatched: dummyData[index].noOfPeopleWatched,
          );
        },
      ),
    );
  }
}
