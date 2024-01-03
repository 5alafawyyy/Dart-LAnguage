import 'package:flutter/material.dart';

import 'search_books_results_view.dart';
import 'widgets.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 50.0,
        right: 18.0,
      ),
      child: Column(
        children: [
          CustomSearchTextForm(),
          SizedBox(height: 16),
          SearchBooksResultsView(),
        ],
      ),
    );
  }
}
