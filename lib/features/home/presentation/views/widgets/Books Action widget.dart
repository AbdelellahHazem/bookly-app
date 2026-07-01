import 'package:bookly_app/core/utils/functions/launch_url.dart';
import 'package:bookly_app/core/widgets/custom%20button.dart';
import 'package:bookly_app/features/home/data/models/Book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: '19.99€',
              Backgroundcolor: Colors.white,
              textcolor: Colors.black,
              borderradius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),

          Expanded(
            child: CustomButton(
              ontap: () async {
                launchcustomurl(context, book.volumeInfo.previewLink!);
              },
              text: 'Free Preview',
              Backgroundcolor: Color(0xFFEF8262),
              textcolor: Colors.white,
              borderradius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
