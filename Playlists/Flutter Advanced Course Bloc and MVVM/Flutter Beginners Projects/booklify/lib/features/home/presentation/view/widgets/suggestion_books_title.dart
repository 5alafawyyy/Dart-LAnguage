import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/constants.dart';
import '../../../../../core/utils/styles/fonts.dart';

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
