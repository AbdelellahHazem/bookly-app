//https://www.googleapis.com/books/v1/volumes?q=intitle:z&subject:programming
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/Book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiservice;
  SearchRepoImpl(this.apiservice);

  @override
  Future<Either<Failure, List<BookModel>>> fetchsearchedBooks({
    required String title,
  }) async {
    try {
      var data = await apiservice.get(
        endpoint:
            'volumes?q=intitle:${Uri.encodeComponent(title)}&printType=books&orderBy=relevance&maxResults=40',
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
