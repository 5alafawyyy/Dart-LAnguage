import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/constants.dart';
import '../../../../../core/utils/styles/fonts.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    required this.rate,
    required this.noOfPeopleWatched,
    this.iconFontSize = FontSize.s18,
    this.rateFontSize = FontSize.s16,
    this.noOfPeopleWatchedFontSize = FontSize.s14,
    this.reteFontWeight = FontWeightManager.regular,
  });

  final String rate;
  final double rateFontSize;
  final double iconFontSize;
  final int noOfPeopleWatched;
  final double noOfPeopleWatchedFontSize;
  final FontWeight reteFontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: iconFontSize,
          color: Constants.starColor,
        ),
        const SizedBox(width: 4),
        Text(
          (rate == 'null') ? '0' : rate,
          style: ThemeData().textTheme.bodyLarge!.copyWith(
                color: Constants.whiteColor,
                fontSize: rateFontSize,
                fontWeight: reteFontWeight,
              ),
        ),
        const SizedBox(width: 4),
        Opacity(
          opacity: 0.5,
          child: Text(
            '($noOfPeopleWatched)',
            style: ThemeData().textTheme.bodySmall!.copyWith(
                  color: Constants.whiteColor,
                  fontSize: noOfPeopleWatchedFontSize,
                  fontWeight: FontWeightManager.regular,
                ),
          ),
        ),
      ],
    );
  }
}
