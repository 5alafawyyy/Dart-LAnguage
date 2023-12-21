import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'fonts.dart';
import 'styles.dart';

abstract class CustomTextTheme {
  static final TextTheme textTheme = const TextTheme().copyWith(
    displayLarge: Styles()
        .getBoldStyle(fontSize: FontSize.s24, color: Constants.whiteColor),
    displaySmall: Styles()
        .getLightStyle(fontSize: FontSize.s24, color: Constants.whiteColor),
    headlineLarge: Styles()
        .getSemiBoldStyle(fontSize: FontSize.s16, color: Constants.whiteColor),
    headlineMedium: Styles()
        .getRegularStyle(fontSize: FontSize.s14, color: Constants.whiteColor),
    titleMedium: Styles()
        .getMediumStyle(fontSize: FontSize.s16, color: Constants.whiteColor),
    bodyLarge: Styles().getRegularStyle(color: Constants.whiteColor),
    bodySmall: Styles().getRegularStyle(color: Constants.whiteColor),
  );
}
