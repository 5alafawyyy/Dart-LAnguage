import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Constants.splashColor),
    );
  }
}
