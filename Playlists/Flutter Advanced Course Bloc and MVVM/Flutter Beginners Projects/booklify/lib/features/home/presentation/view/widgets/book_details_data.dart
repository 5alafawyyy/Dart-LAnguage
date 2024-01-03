import 'package:flutter/material.dart';
import '../../../data/book_model/book_model.dart';

import 'widgets.dart';

class BookDetailsData extends StatelessWidget {
  const BookDetailsData({
    super.key,
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BookDetailsImage(
          networkImageUrl: book.volumeInfo.imageLinks?.thumbnail?? '',
        ),
        const SizedBox(height: 20.0),
        BookDetailsDescription(
          titleText: book.volumeInfo.title!,
          auther: book.volumeInfo.authors![0],
          rate: book.volumeInfo.averageRating?.toDouble() ?? 0,
          noOfPeopleWatched: book.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(height: 20.0),
        const BookDetailsButton(),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
