import 'package:bookly_app/features/search/presentation/view_models/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/search_repo.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this.searchRepo) : super(SearchedBooksInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({required String title}) async {
    emit(SearchedBooksLoading());
    var result = await searchRepo.fetchsearchedBooks(title: title);
    result.fold(
      (failure) {
        emit(SearchedBooksFailure(failure.errMessage));
      },
      (books) {
        emit(SearchedBooksSuccess(books));
      },
    );
  }
}
