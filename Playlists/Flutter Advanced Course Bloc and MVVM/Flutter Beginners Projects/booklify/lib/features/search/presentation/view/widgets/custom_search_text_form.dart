import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/constants/constants.dart';
import '../../view_model/search_for_a_book_cubit/search_for_a_book_cubit.dart';

class CustomSearchTextForm extends StatelessWidget {
  const CustomSearchTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchEditingController =
        TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              size: 25,
            ),
            tooltip: 'Back',
            splashRadius: 25.0,
            iconSize: 25.0,
          ),
        ),
        Expanded(
          flex: 13,
          child: TextFormField(
            controller: searchEditingController,
            cursorColor: Constants.whiteColor,
            decoration: InputDecoration(
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              hintText: 'Search',
              suffixIcon: IconButton(
                onPressed: () async {
                  searchMethod(context, searchEditingController);
                },
                icon: const Icon(
                  Icons.search,
                  color: Constants.whiteColor,
                ),
              ),
            ),
            onFieldSubmitted: (_) {
              searchMethod(context, searchEditingController);
            },
          ),
        ),
      ],
    );
  }

  Future<void> searchMethod(BuildContext context,
      TextEditingController searchEditingController) async {
    {
      await BlocProvider.of<SearchForABookCubit>(context)
          .fetchSearchForABook(title: searchEditingController.text);
    }
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Constants.whiteColor),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
