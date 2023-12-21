import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/constants.dart';

class CustomSearchTextForm extends StatelessWidget {
  const CustomSearchTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          cursorColor: Constants.whiteColor,
          decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: 'Search',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Constants.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Constants.whiteColor),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
