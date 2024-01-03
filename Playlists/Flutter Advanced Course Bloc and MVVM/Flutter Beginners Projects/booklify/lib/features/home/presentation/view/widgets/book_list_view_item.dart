import 'package:booklify/core/utils/router/routes_string.dart';
import 'package:booklify/core/shared/widgets/custom_text_rich.dart';
import 'package:booklify/features/home/data/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/constants/constants.dart';
import '../../../../../core/utils/styles/fonts.dart';
import '../../../../../core/shared/widgets/shared_widgets.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(
            RoutesStrings.bookDetailsView,
            extra: book,
          );
        },
        splashColor: Constants.splashColor,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: BookImage(
                  networkImageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
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
                      book.volumeInfo.title!,
                      style: ThemeData().textTheme.headlineLarge!.copyWith(
                            color: Constants.whiteColor,
                            fontSize: FontSize.s18,
                            fontWeight: FontWeightManager.semiBold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      book.volumeInfo.authors![0],
                      style: ThemeData().textTheme.titleMedium!.copyWith(
                            color: Constants.greyColor,
                            fontSize: FontSize.s16,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomTextRich(
                          text: 'Free',
                          richText: '',
                        ),
                        BookRating(
                          rate: ((book.volumeInfo.averageRating) == null ||
                                  book.volumeInfo.averageRating == 'null')
                              ? '0'
                              : book.volumeInfo.averageRating!.toString(),
                          noOfPeopleWatched: book.volumeInfo.ratingsCount ?? 0,
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
