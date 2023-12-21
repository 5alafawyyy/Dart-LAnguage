import 'package:flutter/material.dart';
import '../../../../../core/utils/assets/assets.dart';
import 'widgets.dart';

class BookDetailsData extends StatelessWidget {
  const BookDetailsData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BookDetailsImage(
          assetName: AssetsData.bookTest1,
        ),
        SizedBox(height: 20.0),
        BookDetailsDescription(
          titleText: 'The Jungle Book',
          auther: 'Rudyard Kipling',
          rate: 4.8,
          noOfPeopleWatched: 5689,
        ),
        SizedBox(height: 20.0),
        BookDetailsButton(),
        SizedBox(height: 20.0),
      ],
    );
  }
}
