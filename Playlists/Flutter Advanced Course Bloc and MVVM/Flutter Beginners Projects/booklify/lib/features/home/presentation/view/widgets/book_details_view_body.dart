import 'package:booklify/core/utils/styles/fonts.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/constants.dart';
import '../../../../../core/shared/widgets/shared_widgets.dart';
import 'widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          BookDetailsViewAppBar(),
          BookDetailsData(),
          SuggestionBooksTitle(),
          SuggestionBooksImages(),
        ],
      ),
    );
  }
}

class SuggestionBooksTitle extends StatelessWidget {
  const SuggestionBooksTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15.0,
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          'You can also like',
          style: ThemeData().textTheme.bodyLarge!.copyWith(
                color: Constants.whiteColor,
                fontSize: FontSize.s14,
              ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

class SuggestionBooksImages extends StatelessWidget {
  const SuggestionBooksImages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 6,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 6.5,
              child: ListView.builder(
                addAutomaticKeepAlives: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: BookImage(
                      assetName: 'assets/images/book_${index + 1}.png',
                      aspectRatio: 2.5 / 4,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
