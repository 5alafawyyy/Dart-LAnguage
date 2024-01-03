import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/data/book_model/book_model.dart';

abstract class BaseSearchForABookRepo {
  Future<Either<Failure, List<BookModel>>> fetchMatchedBooks(
      {required String title});
}
