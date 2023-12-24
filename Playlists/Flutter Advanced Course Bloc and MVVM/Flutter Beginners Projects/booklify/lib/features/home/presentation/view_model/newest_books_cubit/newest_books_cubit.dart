import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/book_model/book_model.dart';
import '../../../data/repos/base_home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final BaseHomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    try {
      final books = await homeRepo.fetchNewestBooks();
      books.fold((failure) {
        emit(NewestBooksError(errMessage: failure.errMessage));
      }, (books) {
        emit(NewestBooksLoaded(books: books));
      });
    } catch (e) {
      emit(NewestBooksError(errMessage: e.toString()));
    }
  }
}
