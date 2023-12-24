part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksLoaded extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksLoaded({required this.books});
}

final class FeaturedBooksError extends FeaturedBooksState {
  final String errMessage;

  const FeaturedBooksError({required this.errMessage});
}
