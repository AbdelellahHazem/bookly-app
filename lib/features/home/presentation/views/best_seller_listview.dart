import 'package:bookly_app/core/widgets/custom%20_error_widget.dart';
import 'package:bookly_app/features/home/presentation/view%20models/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view%20models/newest_books_states.dart';
import 'package:bookly_app/features/home/presentation/views/best_seller_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
          if (state is NewestBooksSuccess) {
            return ListView.builder(
              itemCount: state.books.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerListviewItem(book: state.books[index]),
                );
              },
            );
          } else if (state is NewestBooksFailure) {
            return CustomErrorWidget(errmessege: state.messegerr);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
