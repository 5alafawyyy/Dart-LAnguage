import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/api/api_service.dart';
import '../../../home/data/book_model/book_model.dart';
import 'base_search_for_a_book_repo.dart';

class SearchForABookRepoImpl implements BaseSearchForABookRepo {
  ApiService apiService;
  SearchForABookRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchMatchedBooks(
      {required String title}) async {
    try {
      final data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=intitle:$title');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
