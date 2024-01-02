import 'package:booklify/features/home/presentation/view/widgets/shimmer_features_books_list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/custom_error_widget.dart';
import '../../view_model/featured_books_cubit/featured_books_cubit.dart';
import 'featured_books_list_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksLoading) {
          return const FeaturedBooksListViewItemShimmer();
        } else if (state is FeaturedBooksLoaded) {
          return Container(
            margin: const EdgeInsets.only(
              left: 16.0,
            ),
            height: MediaQuery.sizeOf(context).height * 0.28,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FeaturedBooksListViewItem(
                    book: state.books[index],
                    aspectRatio: (index == 0) ? 2.2 / 3 : 2 / 3,
                    padding: (index == 0) ? 0.0 : 10,
                  ),
                );
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is FeaturedBooksError) {
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
