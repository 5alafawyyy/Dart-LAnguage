import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../book_model/book_model.dart';

abstract class BaseHomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
}
