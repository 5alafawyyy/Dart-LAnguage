import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.widget1,
    required this.widget2,
  });
  final Widget widget1;
  final Widget widget2;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      padding: const EdgeInsets.only(
        top: 30.0,
        bottom: 16.0,
      ),
      child: Row(
        children: [
          widget1,
          const Spacer(),
          widget2,
        ],
      ),
    );
  }
}
