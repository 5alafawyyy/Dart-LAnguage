import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/router/routes_string.dart';
import '../../../data/book_model/book_model.dart';

class FeaturedBooksListViewItem extends StatelessWidget {
  const FeaturedBooksListViewItem({
    super.key,
    required this.book,
    required this.aspectRatio,
    this.padding = 0.0,
  });
  final BookModel book;
  final double aspectRatio;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(RoutesStrings.bookDetailsView, extra: book,);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: CachedNetworkImage(
                  imageUrl: book.volumeInfo.imageLinks.thumbnail,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: const SizedBox()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
