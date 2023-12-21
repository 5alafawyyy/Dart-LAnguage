import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/router/routes_string.dart';
import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    initSlidingAnimation();
    navigateToHomeView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 5.0),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHomeView() {
    Timer(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).push(RoutesStrings.home);
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
