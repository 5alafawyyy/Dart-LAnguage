import 'package:booklify/features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/shared/widgets/custom_error_widget.dart';
import '../../../../../core/shared/widgets/shared_widgets.dart';
import '../../../../../core/utils/router/routes_string.dart';
import '../../../data/book_model/book_model.dart';

class SuggestionBooksImages extends StatelessWidget {
  const SuggestionBooksImages({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 158, 151, 47),
                highlightColor: const Color.fromARGB(255, 100, 94, 2),
                enabled: true,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Specify the number of shimmer items you want
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width /
                            3, // Adjust the width as needed
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
          );
        } else if (state is NewestBooksLoaded) {
          List<BookModel> filteredBooks =
              state.books.where((book) => book.id != this.book.id).toList();
          return SizedBox(
            height: MediaQuery.sizeOf(context).height / 6,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Column(
                children: [
                  SizedBox(
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
                  )
                ],
              ),
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
      },
    );
  }
}
