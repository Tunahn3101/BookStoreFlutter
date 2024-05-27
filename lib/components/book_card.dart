import 'package:flutter/material.dart';
import 'package:learn/pages/homepage/model/book_model.dart';
import 'package:learn/pages/detailsbook/details_book.dart';
import 'package:learn/ultis/next_screen.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.book,
  });

  final BookModel book;

  void _openBookDetail(BuildContext context) {
    nextScreen(
      context,
      DetailsBook(
          imageUrl: book.imageUrl,
          title: book.title,
          description: book.description,
          rating: ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openBookDetail(context);
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              book.imageUrl,
              height: 210,
              width: 150,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              book.title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              book.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
