part of 'search_for_a_book_cubit.dart';

sealed class SearchForABookState extends Equatable {
  const SearchForABookState();

  @override
  List<Object> get props => [];
}

final class SearchForABookInitial extends SearchForABookState {}

final class SearchForABookLoading extends SearchForABookState {}

final class SearchForABookLoaded extends SearchForABookState {
  final List<BookModel> books;

  const SearchForABookLoaded({required this.books});
}

final class SearchForABookError extends SearchForABookState {
  final String errMessage;

  const SearchForABookError({required this.errMessage});
}
