import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/shared/widgets/custom_error_widget.dart';
import '../../../../../core/utils/router/routes_string.dart';
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
          networkImageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
        ),
        const SizedBox(height: 20.0),
        BookDetailsDescription(
          titleText: book.volumeInfo.title!,
          auther: book.volumeInfo.authors![0],
          rate: book.volumeInfo.averageRating?.toString() ?? '0',
          noOfPeopleWatched: book.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(height: 20.0),
        Visibility(
          visible: book.volumeInfo.previewLink != null,
          child: BookDetailsButton(
            canBeOpened:
                book.accessInfo!.pdf!.downloadLink == null ? false : true,
            onPressed: book.accessInfo!.pdf!.downloadLink == null
                ? () async {
                    final Uri url = Uri.parse('${book.volumeInfo.previewLink}');
                    if (!await launchUrl(url)) {
                      const ScaffoldMessenger(
                        child: CustomErrorWidget(
                          errMessage: 'Could not launch the book',
                        ),
                      );
                    }
                  }
                : () {
                    GoRouter.of(context).push(
                      RoutesStrings.pdfViewerView,
                      extra: book,
                    );
                  },
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
