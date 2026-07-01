import 'package:bookly_app/features/home/data/models/Book_model.dart';

abstract class SearchedBooksState {}

class SearchedBooksInitial extends SearchedBooksState {}

class SearchedBooksLoading extends SearchedBooksState {}

class SearchedBooksFailure extends SearchedBooksState {
  final String errmesege;
  SearchedBooksFailure(this.errmesege);
}

class SearchedBooksSuccess extends SearchedBooksState {
  final List<BookModel> books;
  SearchedBooksSuccess(this.books);
}
