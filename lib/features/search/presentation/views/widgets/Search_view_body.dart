import 'package:bookly_app/features/search/presentation/view_models/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/view_models/search_states.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/Custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            controller: _controller,
            onSubmitted: (title) {
              if (title.trim().isEmpty) return;
              context.read<SearchedBooksCubit>().fetchSearchedBooks(
                title: title.trim(),
              );
            },
          ),
          const SizedBox(height: 16),
          Text('Search Result', style: Styles.textstyle18),
          const SizedBox(height: 16),
          BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
            builder: (context, state) {
              if (state is SearchedBooksLoading) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is SearchedBooksSuccess) {
                return SearchResultListview(books: state.books);
              } else if (state is SearchedBooksFailure) {
                return Expanded(
                  child: Center(
                    child: Text(
                      state.errmesege,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
