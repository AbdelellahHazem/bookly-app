import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getit = GetIt.instance;
void setupservicelocator() {
  getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(ApiService(Dio())));
  getit.registerSingleton<SearchRepoImpl>(SearchRepoImpl(ApiService(Dio())));
}
