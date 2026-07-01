import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/data/models/Book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchsearchedBooks({
    required String title,
  });
}
