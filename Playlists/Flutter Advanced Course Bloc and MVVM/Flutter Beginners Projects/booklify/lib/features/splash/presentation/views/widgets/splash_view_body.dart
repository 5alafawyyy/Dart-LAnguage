import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../home.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    // Simulate some initialization work
    Timer(
      const Duration(seconds: 3),
      () {
        // Navigate to the main screen after 3 seconds
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetsData.logo,
        scale: 0.7,
      ),
    );
  }
}
