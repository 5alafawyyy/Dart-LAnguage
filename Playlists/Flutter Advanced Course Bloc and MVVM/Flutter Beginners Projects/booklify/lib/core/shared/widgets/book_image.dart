import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'shimmer_placeholder_image.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
    required this.networkImageUrl,
    required this.aspectRatio,
  });

  final String networkImageUrl;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: networkImageUrl,
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              ShimmerPlaceholderImage(aspectRatio: aspectRatio),
          errorWidget: (context, url, error) {
            StatelessWidget errWidget =
                ShimmerPlaceholderImage(aspectRatio: aspectRatio);

            return StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState) {
                Future.delayed(const Duration(seconds: 2), () {
                  errWidget = const Icon(Icons.image_not_supported_rounded);
                  setState(() {});
                });
                return errWidget;
              },
            );
          },
        ),
      ),
    );
  }
}
