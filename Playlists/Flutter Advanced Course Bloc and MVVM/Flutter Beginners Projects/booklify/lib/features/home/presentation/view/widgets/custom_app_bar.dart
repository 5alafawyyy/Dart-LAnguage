import 'package:flutter/material.dart';
import '../../../../../core/utils/assets/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

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
          Image.asset(
            AssetsData.logoText,
            width: 100.0,
            height: 25.0,
            fit: BoxFit.cover,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Image.asset(AssetsData.searchIcon),
            iconSize: 25.0,
            splashRadius: 15,
            tooltip: 'Search',
          ),
        ],
      ),
    );
  }
}
