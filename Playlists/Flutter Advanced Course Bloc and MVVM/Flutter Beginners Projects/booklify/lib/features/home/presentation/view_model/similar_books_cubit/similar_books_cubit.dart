import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/book_model/book_model.dart';
import '../../../data/repos/base_home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final BaseHomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    try {
      final books = await homeRepo.fetchSimilarBooks(category: category);
      books.fold((failure) {
        print(books);
        emit(SimilarBooksError(errMessage: failure.errMessage));
      }, (books) {
        print(books);
        emit(SimilarBooksLoaded(books: books));
      });
    } catch (e) {
      print(e);
      emit(SimilarBooksError(errMessage: e.toString()));
    }
  }
}
