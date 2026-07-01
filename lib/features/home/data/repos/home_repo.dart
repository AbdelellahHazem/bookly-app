import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/Book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestsellerbooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchsimilarBooks({
    required String category,
  });
}
