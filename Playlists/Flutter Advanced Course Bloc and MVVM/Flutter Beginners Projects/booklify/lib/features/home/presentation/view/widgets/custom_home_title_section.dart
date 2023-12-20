import 'package:flutter/material.dart';
import 'package:booklify/core/utils/constants/constants.dart';
import '../../../../../core/utils/styles/fonts.dart';

class CustomHomeTitleSection extends StatelessWidget {
  const CustomHomeTitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        'Best Seller',
        style: ThemeData().textTheme.titleMedium!.copyWith(
              color: Constants.whiteColor,
              fontSize: FontSize.s22,
            ),
      ),
    );
  }
}
