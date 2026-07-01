import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });
  final MainAxisAlignment mainAxisAlignment;
  final double rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(FontAwesomeIcons.solidStar, size: 14, color: Color(0xFFFFDD4F)),
        SizedBox(width: 6.3),
        Text(rating.toString(), style: Styles.textstyle16),
        SizedBox(width: 5),
        Text(
          '($count)',
          style: Styles.textstyle14.copyWith(
            color: Color(0xFF707070),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
