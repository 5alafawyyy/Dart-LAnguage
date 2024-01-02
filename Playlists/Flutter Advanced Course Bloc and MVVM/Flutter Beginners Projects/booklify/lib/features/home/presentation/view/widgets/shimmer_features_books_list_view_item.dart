import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedBooksListViewItemShimmer extends StatelessWidget {
  const FeaturedBooksListViewItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:const Color.fromARGB(255, 158, 151, 47),
      highlightColor:const Color.fromARGB(255, 100, 94, 2),
      enabled: true,
      child: Container(
        margin: const EdgeInsets.only(
          left: 16.0,
        ),
        height: MediaQuery.sizeOf(context).height * 0.28,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
