import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/shared/widgets/custom_error_widget.dart';
import '../../../../../core/shared/widgets/shared_widgets.dart';
import '../../../../../core/utils/router/routes_string.dart';
import '../../../data/book_model/book_model.dart';
import '../../view_model/similar_books_cubit/similar_books_cubit.dart';

class SimilarBooks extends StatelessWidget {
  const SimilarBooks({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 158, 151, 47),
                highlightColor: const Color.fromARGB(255, 100, 94, 2),
                enabled: true,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 6.5,
                  child: ListView.builder(
                    addAutomaticKeepAlives: false,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width /
                              6, // Adjust the width as needed
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        } else if (state is SimilarBooksLoaded) {
          List<BookModel> filteredBooks =
              state.books.where((book) => book.id != this.book.id).toList();
          print(
            MediaQuery.sizeOf(context).height / 6,
          );
          return SizedBox(
            height: MediaQuery.sizeOf(context).height / 6,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height / 6.5,
                child: ListView.builder(
                  addAutomaticKeepAlives: false,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: filteredBooks.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        GoRouter.of(context).push(
                          RoutesStrings.bookDetailsView,
                          extra: filteredBooks[index],
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: BookImage(
                          networkImageUrl: filteredBooks[index]
                                  .volumeInfo
                                  .imageLinks
                                  ?.thumbnail ??
                              '',
                          aspectRatio: 2.5 / 4,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is SimilarBooksError) {
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
