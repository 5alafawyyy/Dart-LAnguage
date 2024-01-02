import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBookListViewItem extends StatelessWidget {
  const ShimmerBookListViewItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 8,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 158, 151, 47),
                      highlightColor: const Color.fromARGB(255, 100, 94, 2),
                      enabled: true,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 158, 151, 47),
                          highlightColor: const Color.fromARGB(255, 100, 94, 2),
                          enabled: true,
                          child: Container(
                            height: 20,
                            width: double.infinity,
                            color: Colors.grey[300],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 158, 151, 47),
                          highlightColor: const Color.fromARGB(255, 100, 94, 2),
                          enabled: true,
                          child: Container(
                            height: 16,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Colors.grey[300],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Shimmer.fromColors(
                              baseColor:
                                  const Color.fromARGB(255, 158, 151, 47),
                              highlightColor:
                                  const Color.fromARGB(255, 100, 94, 2),
                              enabled: true,
                              child: Container(
                                height: 16,
                                width: 40,
                                color: Colors.grey[300],
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor:
                                  const Color.fromARGB(255, 158, 151, 47),
                              highlightColor:
                                  const Color.fromARGB(255, 100, 94, 2),
                              enabled: true,
                              child: Container(
                                height: 16,
                                width: 60,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
