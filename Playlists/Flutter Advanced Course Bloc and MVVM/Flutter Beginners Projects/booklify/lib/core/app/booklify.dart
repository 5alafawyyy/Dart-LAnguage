import 'package:flutter/material.dart';
import '../utils/constants/constants.dart';
import '../utils/router/app_router.dart';
import '../utils/styles/custom_theme_data.dart';

class BooklifyApp extends StatelessWidget {
  const BooklifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.themeData,
      routerConfig: AppRouter.router,
    );
  }
}
