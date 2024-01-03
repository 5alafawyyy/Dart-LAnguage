part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksLoaded extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksLoaded({required this.books});
}

final class SimilarBooksError extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksError({required this.errMessage});
}
