import 'package:flutter/material.dart';

import '../../../../shared/widgets/shared_widgets.dart';

class BookDetailsImage extends StatelessWidget {
  const BookDetailsImage({
    super.key,
    required this.assetName,
  });
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2.8,
      child: BookImage(
        assetName: assetName,
        aspectRatio: 2 / 3,
      ),
    );
  }
}
