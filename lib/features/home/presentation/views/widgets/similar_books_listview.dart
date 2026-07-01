import 'package:bookly_app/core/widgets/custom%20_error_widget.dart';
import 'package:bookly_app/features/home/presentation/view%20models/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view%20models/similar_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_listview_item.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomListviewBuilder(
                  imageurl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                ),
              );
            },
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errmessege: state.messegerr);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
    ;
  }
}
