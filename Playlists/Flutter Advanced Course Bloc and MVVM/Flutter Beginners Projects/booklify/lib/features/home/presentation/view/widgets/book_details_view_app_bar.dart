import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/shared_widgets.dart';

class BookDetailsViewAppBar extends StatelessWidget {
  const BookDetailsViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      widget1: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: const Icon(Icons.clear),
        iconSize: 32.0,
        splashRadius: 20,
        tooltip: 'Back',
      ),
      widget2: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart_outlined),
        iconSize: 32.0,
        splashRadius: 15,
        tooltip: 'Cart',
      ),
    );
  }
}
