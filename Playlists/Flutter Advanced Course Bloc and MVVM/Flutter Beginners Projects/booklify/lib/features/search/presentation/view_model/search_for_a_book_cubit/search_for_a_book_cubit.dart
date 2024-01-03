import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/book_model/book_model.dart';
import '../../../data/repos/base_search_for_a_book_repo.dart';

part 'search_for_a_book_state.dart';

class SearchForABookCubit extends Cubit<SearchForABookState> {
  SearchForABookCubit(this.searchForABookRepo) : super(SearchForABookInitial());

  final BaseSearchForABookRepo searchForABookRepo;
  Future<void> fetchSearchForABook({required String title}) async {
    emit(SearchForABookLoading());
    try {
      final books = await searchForABookRepo.fetchMatchedBooks(title: title);
      books.fold((failure) {
        emit(SearchForABookError(errMessage: failure.errMessage));
      }, (books) {
        emit(SearchForABookLoaded(books: books));
      });
    } catch (e) {
      emit(SearchForABookError(errMessage: e.toString()));
    }
  }
}
