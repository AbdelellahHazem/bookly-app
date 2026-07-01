import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/Featured_books_listview.dart';
import 'package:bookly_app/features/home/presentation/views/best_seller_listview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: FeaturedBooksListview(),
            ),
            SizedBox(height: 50),
            Text('Best Seller', style: Styles.textstyle18),

            SizedBox(height: 20),

            BestSellerListview(),
          ],
        ),
      ),
    );
  }
}
