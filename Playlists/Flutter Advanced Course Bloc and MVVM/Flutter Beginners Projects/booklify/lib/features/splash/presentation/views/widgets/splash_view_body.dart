import 'dart:async';

import 'package:flutter/material.dart';

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
    return Container(
      color: const Color.fromARGB(255, 0, 10, 8),
      child: Center(
        child: Image.asset(
          'assets/images/Logo.png',
          width: 150.0,
        ),
      ),
    );
  }
}
