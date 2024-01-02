import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared/widgets/custom_error_widget.dart';
import '../../view_model/newest_books_cubit/newest_books_cubit.dart';
import 'book_list_view_item.dart';
import 'shimmer_book_list_view_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
      if (state is NewestBooksLoading) {
        return const ShimmerBookListViewItem();
      } else if (state is NewestBooksLoaded) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return BookListViewItem(
                book: state.books[index],
              );
            },
          ),
        );
      } else if (state is NewestBooksError) {
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
    });
  }
}
