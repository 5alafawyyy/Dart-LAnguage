// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booklify/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/styles/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
    required this.errMessage,
  }) : super(key: key);
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: Styles().getMediumStyle(
          color: Constants.whiteColor,
        ),
      ),
    );
  }
}
