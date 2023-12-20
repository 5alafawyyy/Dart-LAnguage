import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/constants.dart';
import '../../../../../core/utils/styles/fonts.dart';

class BestSellerBooksListItem extends StatelessWidget {
  const BestSellerBooksListItem({
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
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.15,
              child: AspectRatio(
                aspectRatio: 1.8 / 4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        assetName,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
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
                  // 'J.K. Rowling',
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
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$price',
                            style: ThemeData().textTheme.displayLarge!.copyWith(
                                  color: Constants.whiteColor,
                                  fontSize: FontSize.s20,
                                  fontWeight: FontWeightManager.bold,
                                ),
                          ),
                          TextSpan(
                            text: ' €',
                            style: ThemeData().textTheme.bodyLarge!.copyWith(
                                  color: Constants.whiteColor,
                                  fontSize: FontSize.s16,
                                  fontWeight: FontWeightManager.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: FontSize.s24,
                          color: Constants.starColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$rate',
                          style: ThemeData().textTheme.bodyLarge!.copyWith(
                                color: Constants.whiteColor,
                                fontSize: FontSize.s20,
                                fontWeight: FontWeightManager.regular,
                              ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '($noOfPeopleWatched)',
                          style: ThemeData().textTheme.bodySmall!.copyWith(
                                color: Constants.greyColor,
                                fontSize: FontSize.s14,
                                fontWeight: FontWeightManager.regular,
                              ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<BestSellerBooksListItem> dummyData = const [
  BestSellerBooksListItem(
    assetName: 'assets/images/book_4.png',
    titleText: 'Harry Potter and the Goblet of Fire',
    auther: 'J.K. Rowling',
    price: 19.99,
    rate: 4.8,
    noOfPeopleWatched: 2390,
  ),
  BestSellerBooksListItem(
    assetName: 'assets/images/book_1.png',
    titleText: 'The Jungle Book',
    auther: 'Rudyard Kipling',
    price: 24.99,
    rate: 4.5,
    noOfPeopleWatched: 5689,
  ),
  BestSellerBooksListItem(
    assetName: 'assets/images/book_5.png',
    titleText: 'Star Wars Return of the Jedi',
    auther: 'James Kahn',
    price: 19.99,
    rate: 4.2,
    noOfPeopleWatched: 2564,
  ),
];
