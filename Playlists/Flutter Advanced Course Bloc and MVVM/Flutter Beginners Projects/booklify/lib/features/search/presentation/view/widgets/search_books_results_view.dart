import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/custom_circular_progress_indicator.dart';
import '../../../../../core/shared/widgets/custom_error_widget.dart';
import '../../../../home/presentation/view/widgets/book_list_view_item.dart';
import '../../view_model/search_for_a_book_cubit/search_for_a_book_cubit.dart';

class SearchBooksResultsView extends StatelessWidget {
  const SearchBooksResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForABookCubit, SearchForABookState>(
      builder: (context, state) {
        if (state is SearchForABookInitial) {
          return const SizedBox();
        }
        if (state is SearchForABookLoading) {
          return const Expanded(
            child: CustomCircularProgressIndicator(),
          );
        } else if (state is SearchForABookLoaded) {
          return Expanded(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.78,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 5.0,
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.books.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BookListViewItem(
                      book: state.books[index],
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is SearchForABookError) {
          return CustomErrorWidget(
            errMessage: state.errMessage.toString(),
          );
        } else {
          return const Center(
            child: CustomErrorWidget(
              errMessage: 'Something went wrong',
            ),
          );
        }
      },
    );
  }
}
