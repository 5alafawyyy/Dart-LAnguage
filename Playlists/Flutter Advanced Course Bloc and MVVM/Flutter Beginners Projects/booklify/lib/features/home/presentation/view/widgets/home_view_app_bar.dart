import 'package:flutter/material.dart';
import '../../../../../core/utils/assets/assets.dart';
import '../../../../shared/widgets/shared_widgets.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      widget1: Image.asset(
        AssetsData.logoText,
        width: 100.0,
        height: 25.0,
        fit: BoxFit.cover,
      ),
      widget2: IconButton(
        onPressed: () {},
        icon: Image.asset(AssetsData.searchIcon),
        iconSize: 25.0,
        splashRadius: 15,
        tooltip: 'Search',
      ),
    );
  }
}
