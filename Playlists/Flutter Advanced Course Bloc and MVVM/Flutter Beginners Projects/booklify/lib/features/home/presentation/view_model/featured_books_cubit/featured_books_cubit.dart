import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/book_model/book_model.dart';
import '../../../data/repos/base_home_repo.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final BaseHomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    try {
      final books = await homeRepo.fetchFeaturedBooks();
      books.fold((failure) {
        emit(FeaturedBooksError(errMessage: failure.errMessage));
      }, (books) {
        emit(FeaturedBooksLoaded(books: books));
      });
    } catch (e) {
      emit(FeaturedBooksError(errMessage: e.toString()));
    }
  }
}
