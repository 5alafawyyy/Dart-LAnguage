import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/router/routes_string.dart';

class FeaturedBooksListViewItem extends StatelessWidget {
  const FeaturedBooksListViewItem({
    super.key,
    required this.assetName,
    required this.aspectRatio,
    this.padding = 0.0,
  });
  final String assetName;
  final double aspectRatio;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(RoutesStrings.bookDetailsView);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(
                      assetName,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -30,
              right: -30,
              child: IconButton(
                onPressed: () {},
                icon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage(
                        AssetsData.play,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                iconSize: 100.0,
                tooltip: 'Play',
                splashRadius: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
