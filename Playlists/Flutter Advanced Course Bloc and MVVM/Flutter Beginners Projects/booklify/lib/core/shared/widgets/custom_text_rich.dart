import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';
import '../../utils/styles/fonts.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
    required this.text,
    required this.richText,
    this.textColor = Constants.whiteColor,
    this.textFontSize = FontSize.s20,
    this.fontWeight = FontWeightManager.bold,
    this.richTextFontSize = FontSize.s16,
  });

  final String text;
  final String richText;
  final Color textColor;
  final double textFontSize;
  final FontWeight fontWeight;
  final double richTextFontSize;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: ThemeData().textTheme.bodyLarge!.copyWith(
                  color: textColor,
                  fontSize: textFontSize,
                  fontWeight: fontWeight,
                ),
          ),
          TextSpan(
            text: richText,
            style: ThemeData().textTheme.bodyLarge!.copyWith(
                  color: textColor,
                  fontSize: richTextFontSize,
                  fontWeight: fontWeight,
                ),
          ),
        ],
      ),
    );
  }
}
