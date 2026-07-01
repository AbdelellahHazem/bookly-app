import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/Book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiservice;
  HomeRepoImpl(this.apiservice);

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestsellerbooks() async {
    try {
      var data = await apiservice.get(
        endpoint:
            'volumes?q=subject:programming&printType=books &filter=free-ebooks&orderBy=relevance &maxResults=40&startIndex=0',
      );
      List<BookModel> books = [];
      if (data['items'] == null) return right(books);

      for (var item in data['items']) {
        if (item['volumeInfo'] == null ||
            item['volumeInfo']['imageLinks'] == null)
          continue;
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          print('Skipping malformed book item: $e');
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiservice.get(
        endpoint:
            'volumes?q=subject:computers+programming&printType=books&orderBy=relevance&maxResults=40',
      );
      List<BookModel> books = [];
      if (data['items'] == null) return right(books);
      for (var item in data['items']) {
        if (item['volumeInfo'] == null ||
            item['volumeInfo']['imageLinks'] == null)
          continue;
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          print('Skipping malformed book item: $e');
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchsimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiservice.get(
        endpoint:
            'volumes?q=subject:programming&Sorting==relevance&printType=books&orderBy=relevance&maxResults=40',
      );
      List<BookModel> books = [];
      if (data['items'] == null) return right(books);
      for (var item in data['items']) {
        if (item['volumeInfo'] == null ||
            item['volumeInfo']['imageLinks'] == null)
          continue;
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          print('Skipping malformed book item: $e');
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
