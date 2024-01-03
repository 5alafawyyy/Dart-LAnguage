import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholderImage extends StatelessWidget {
  const ShimmerPlaceholderImage({
    super.key,
    required this.aspectRatio,
  });

  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 158, 151, 47),
      highlightColor: const Color.fromARGB(255, 100, 94, 2),
      enabled: true,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300], // Shimmer color
          ),
        ),
      ),
    );
  }
}
