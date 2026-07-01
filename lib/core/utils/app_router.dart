import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/models/Book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/presentation/view%20models/similar_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/view_models/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/search%20view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/data/repos/search_repo_imp.dart';
import '../../features/splash/presentation/views/splash _view.dart';

abstract class AppRouter {
  static const khomeview = '/homeview';
  static const kbookdetailsveiw = '/bookdetailsview';
  static const ksearchveiw = '/searchview';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Splashview()),
      GoRoute(path: khomeview, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kbookdetailsveiw,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getit.get<HomeRepoImpl>()),
          child: BookDetailsView(book: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: ksearchveiw,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchedBooksCubit(getit.get<SearchRepoImpl>()),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
