import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/shared_widgets.dart';

class BookDetailsImage extends StatelessWidget {
  const BookDetailsImage({
    super.key,
    required this.networkImageUrl,
  });
  final String networkImageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 3.2,
      child: BookImage(
        networkImageUrl: networkImageUrl,
        aspectRatio: 2 / 3,
      ),
    );
  }
}
