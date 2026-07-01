import 'package:bookly_app/features/home/data/models/Book_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/styles.dart';
import '../Book_Rating.dart';
import 'custom_listview_item.dart';

class BookDetailsSection extends StatelessWidget {
  final BookModel book;
  const BookDetailsSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomListviewBuilder(
            imageurl: book.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        SizedBox(height: 43),
        Text(
          book.volumeInfo.title!,
          style: Styles.textstyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo.authors[0],
            style: Styles.textstyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
        ),
      ],
    );
  }
}
