import 'package:flutter/material.dart';

import 'book_list_view_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return BookListViewItem(
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
