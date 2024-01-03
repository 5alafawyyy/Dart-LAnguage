import 'package:flutter/material.dart';
import 'package:booklify/core/utils/constants/constants.dart';
import 'package:booklify/core/utils/styles/custom_text_theme.dart';
import 'package:booklify/core/utils/styles/fonts.dart';
import '../../../../../core/shared/widgets/custom_text_rich.dart';

class BookDetailsButton extends StatelessWidget {
  const BookDetailsButton({
    super.key,
    required this.onPressed,
    required this.canBeOpened,
  });
  final void Function() onPressed;
  final bool canBeOpened;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.055,
      width: MediaQuery.sizeOf(context).width * 0.6,
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
                  text: 'Free',
                  richText: ' ',
                  textColor: Constants.blackColor,
                  richTextFontSize: FontSize.s12,
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
              child: TextButton(
                onPressed: onPressed,
                child: Center(
                  child: Text(
                    canBeOpened ? 'Preview' : 'Free Preview',
                    style: CustomTextTheme.textTheme.bodyLarge!.copyWith(
                      fontSize: canBeOpened ? FontSize.s16 : FontSize.s12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
