import 'package:bookly_app/core/widgets/custom%20_error_widget.dart';
import 'package:bookly_app/features/home/presentation/view%20models/featured_books_states.dart';
import 'package:bookly_app/features/home/presentation/view%20models/featurted_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';

class FeaturedBooksListview extends StatelessWidget {
  const FeaturedBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kbookdetailsveiw,
                      extra: state.books[index],
                    );
                  },

                  child: CustomListviewBuilder(
                    imageurl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                        '',
                  ),
                ),
              );
            },
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errmessege: state.errmesege);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
