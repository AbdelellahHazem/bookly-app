import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/Book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/Book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/Books%20Action%20widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_listview.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel book;
  const BookDetailsViewBody({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppbar(),

                BookDetailsSection(book: book),
                SizedBox(height: 37),
                BooksAction(book: book),
                SizedBox(height: 50),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'You can also like this',
                    style: Styles.textstyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                  child: SimilarBooksListview(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
