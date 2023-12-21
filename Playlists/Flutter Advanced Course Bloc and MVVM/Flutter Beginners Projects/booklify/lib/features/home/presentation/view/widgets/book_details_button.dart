import 'package:flutter/material.dart';
import 'package:booklify/core/utils/constants/constants.dart';
import 'package:booklify/core/utils/styles/custom_text_theme.dart';
import 'package:booklify/core/utils/styles/fonts.dart';
import '../../../../shared/widgets/custom_text_rich.dart';

class BookDetailsButton extends StatelessWidget {
  const BookDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Constants.splashColor,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.07,
        width: MediaQuery.sizeOf(context).width * 0.7,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  color: Constants.whiteColor,
                ),
                child: const Center(
                  child: CustomTextRich(
                    text: '19.99',
                    richText: '€',
                    textColor: Constants.blackColor,
                    richTextFontSize: FontSize.s16,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  color: Constants.splashColor,
                ),
                child: Center(
                  child: Text(
                    'Free preview',
                    style: CustomTextTheme.textTheme.bodyLarge!.copyWith(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
