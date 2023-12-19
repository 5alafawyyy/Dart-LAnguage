import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../home.dart';
import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();

    // Simulate some initialization work
    // Timer(
    //   const Duration(seconds: 3),
    //   () {
    //     // Navigate to the main screen after 3 seconds
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => const HomeScreen()),
    //     );
    //   },
    // );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            AssetsData.logo,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }
}
