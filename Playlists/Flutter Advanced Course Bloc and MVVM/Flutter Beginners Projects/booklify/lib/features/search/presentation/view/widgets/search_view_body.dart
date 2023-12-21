import 'package:flutter/material.dart';
import '../../../../home/presentation/view/widgets/book_list_view_item.dart';
import 'widgets.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: [
          CustomSearchTextForm(),
          SizedBox(height: 16),
          SearchBooksListView(),
        ],
      ),
    );
  }
}

class SearchBooksListView extends StatelessWidget {
  const SearchBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.78,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
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
      ),
    );
  }
}
