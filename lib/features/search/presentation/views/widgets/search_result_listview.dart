import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/models/Book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultListview extends StatelessWidget {
  const SearchResultListview({super.key, required this.books});

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text('No results', style: TextStyle(color: Colors.white)),
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          final imageUrl = book.volumeInfo.imageLinks?.thumbnail;
          final authors = book.volumeInfo.authors;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {
                context.push(AppRouter.kbookdetailsveiw, extra: book);
              },
              leading: imageUrl != null
                  ? Image.network(imageUrl, width: 50, fit: BoxFit.cover)
                  : const Icon(Icons.book, color: Colors.white, size: 40),
              title: Text(
                book.volumeInfo.title ?? '',
                style: const TextStyle(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                (authors == null || authors.isEmpty)
                    ? 'Unknown author'
                    : authors.join(', '),
                style: const TextStyle(color: Colors.grey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }
}
