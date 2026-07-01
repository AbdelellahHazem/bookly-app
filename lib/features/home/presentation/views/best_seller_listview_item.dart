import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/Book_model.dart';
import 'package:bookly_app/features/home/presentation/views/Book_Rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListviewItem extends StatelessWidget {
  final BookModel book;
  const BestSellerListviewItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kbookdetailsveiw, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      book.volumeInfo.imageLinks?.thumbnail ?? '',
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.volumeInfo.title ?? "",
                      maxLines: 2,
                      style: Styles.textstyle20.copyWith(
                        fontFamily: KGTSectraFine,
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(book.volumeInfo.authors[0], style: Styles.textstyle14),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Text('Free', style: Styles.textstyle20),
                      Spacer(),
                      BookRating(
                        rating: book.volumeInfo.averageRating ?? 0,
                        count: book.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
