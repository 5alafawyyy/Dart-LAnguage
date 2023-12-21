import 'package:flutter/material.dart';

import 'best_seller_books_list_view_item.dart';

class BestSellerBooksListView extends StatelessWidget {
  const BestSellerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.sizeOf(context).height * 0.6,
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return BestSellerBooksListViewItem(
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
