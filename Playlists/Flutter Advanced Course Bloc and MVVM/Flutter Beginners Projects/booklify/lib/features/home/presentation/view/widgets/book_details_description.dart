import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/constants.dart';
import '../../../../../core/utils/styles/fonts.dart';
import 'book_rating.dart';

class BookDetailsDescription extends StatelessWidget {
  const BookDetailsDescription({
    super.key,
    required this.titleText,
    required this.auther,
    required this.rate,
    required this.noOfPeopleWatched,
  });

  final String titleText;
  final String auther;
  final String rate;
  final int noOfPeopleWatched;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titleText,
          style: ThemeData().textTheme.displayLarge!.copyWith(
                color: Constants.whiteColor,
                fontSize: FontSize.s20,
                fontWeight: FontWeightManager.regular,
              ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5.0),
        Opacity(
          opacity: 0.7,
          child: Text(
            auther,
            style: ThemeData().textTheme.titleMedium!.copyWith(
                  color: Constants.whiteColor,
                  fontSize: FontSize.s16,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BookRating(
              rate: rate,
              noOfPeopleWatched: noOfPeopleWatched,
              iconFontSize: FontSize.s16,
              rateFontSize: FontSize.s16,
              noOfPeopleWatchedFontSize: FontSize.s14,
              reteFontWeight: FontWeightManager.bold,
            )
          ],
        )
      ],
    );
  }
}
