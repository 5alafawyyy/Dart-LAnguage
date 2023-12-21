import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../book_model/book_model.dart';
import 'base_home_repo.dart';

class HomeRepoImpl implements BaseHomeRepo{
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() {
    throw UnimplementedError();
  
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
  
}