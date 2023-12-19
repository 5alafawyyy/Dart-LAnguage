import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/splash/presentation/views/splash_view.dart';
import '../utils/constants/constants.dart';


class BooklifyApp extends StatelessWidget {
  const BooklifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Booklify',
      theme: ThemeData.dark()
          .copyWith(
        primaryColor: Constants.mainColor,
        scaffoldBackgroundColor:  Constants.mainColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const SplashView(),
    );
  }
}
