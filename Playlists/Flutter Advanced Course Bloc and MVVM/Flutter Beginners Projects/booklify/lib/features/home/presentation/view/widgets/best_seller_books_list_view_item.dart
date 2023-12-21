import 'package:booklify/core/utils/router/routes_string.dart';
import 'package:booklify/core/shared/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/constants/constants.dart';
import '../../../../../core/utils/styles/fonts.dart';
import '../../../../../core/shared/widgets/shared_widgets.dart';
import 'book_rating.dart';

class BestSellerBooksListViewItem extends StatelessWidget {
  const BestSellerBooksListViewItem({
    super.key,
    required this.assetName,
    required this.titleText,
    required this.auther,
    required this.price,
    required this.rate,
    required this.noOfPeopleWatched,
  });
  final String assetName;
  final String titleText;
  final String auther;
  final double price;
  final double rate;
  final int noOfPeopleWatched;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(RoutesStrings.bookDetailsView);
        },
        splashColor: Constants.splashColor,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: BookImage(
                  assetName: assetName,
                  aspectRatio: 1.8 / 4,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText,
                      style: ThemeData().textTheme.headlineLarge!.copyWith(
                            color: Constants.whiteColor,
                            fontSize: FontSize.s18,
                            fontWeight: FontWeightManager.semiBold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      auther,
                      style: ThemeData().textTheme.titleMedium!.copyWith(
                            color: Constants.greyColor,
                            fontSize: FontSize.s16,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextRich(
                          text: '$price',
                          richText: ' €',
                        ),
                        BookRating(
                          rate: rate,
                          noOfPeopleWatched: noOfPeopleWatched,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<BestSellerBooksListViewItem> dummyData = const [
  BestSellerBooksListViewItem(
    assetName: 'assets/images/book_4.png',
    titleText: 'Harry Potter and the Goblet of Fire',
    auther: 'J.K. Rowling',
    price: 19.99,
    rate: 4.8,
    noOfPeopleWatched: 2390,
  ),
  BestSellerBooksListViewItem(
    assetName: 'assets/images/book_1.png',
    titleText: 'The Jungle Book',
    auther: 'Rudyard Kipling',
    price: 24.99,
    rate: 4.5,
    noOfPeopleWatched: 5689,
  ),
  BestSellerBooksListViewItem(
    assetName: 'assets/images/book_5.png',
    titleText: 'Star Wars Return of the Jedi',
    auther: 'James Kahn',
    price: 19.99,
    rate: 4.2,
    noOfPeopleWatched: 2564,
  ),
];
