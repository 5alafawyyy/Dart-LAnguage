import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'custom_text_theme.dart';

abstract class CustomThemeData {
  static ThemeData themeData = ThemeData.dark().copyWith(
    primaryColor: Constants.mainColor,
    scaffoldBackgroundColor: Constants.mainColor,
    useMaterial3: false,
    textTheme: CustomTextTheme.textTheme,
  );
}
