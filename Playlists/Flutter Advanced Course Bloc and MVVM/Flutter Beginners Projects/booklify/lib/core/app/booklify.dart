import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/splash/presentation/views/splash_view.dart';
import '../utils/constants/constants.dart';
import '../utils/styles/fonts.dart';
import '../utils/styles/styles.dart';

class BooklifyApp extends StatelessWidget {
  const BooklifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Booklify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Constants.mainColor,
        scaffoldBackgroundColor: Constants.mainColor,
        useMaterial3: false,
        textTheme: const TextTheme().copyWith(
          displayLarge: Styles().getBoldStyle(
              fontSize: FontSize.s24, color: Constants.whiteColor),
          headlineLarge: Styles().getSemiBoldStyle(
              fontSize: FontSize.s16, color: Constants.whiteColor),
          headlineMedium: Styles().getRegularStyle(
              fontSize: FontSize.s14, color: Constants.whiteColor),
          titleMedium: Styles().getMediumStyle(
              fontSize: FontSize.s16, color: Constants.whiteColor),
          bodyLarge: Styles().getRegularStyle(color: Constants.whiteColor),
          bodySmall: Styles().getRegularStyle(color: Constants.whiteColor),
        ),
      ),
      home: const SplashView(),
    );
  }
}
