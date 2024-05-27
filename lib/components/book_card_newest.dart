import 'package:flutter/material.dart';
import 'package:learn/pages/homepage/model/book_model.dart';
import 'package:learn/pages/detailsbook/details_book.dart';
import 'package:learn/ultis/next_screen.dart';

class BookCardVertical extends StatefulWidget {
  const BookCardVertical({
    super.key,
    required this.book,
  });

  final BookModel book;
  @override
  State<BookCardVertical> createState() => _BookCardVerticalState();
}

class _BookCardVerticalState extends State<BookCardVertical> {
  void _openBookDetail(BuildContext context) {
    nextScreen(
      context,
      DetailsBook(
        imageUrl: widget.book.imageUrl,
        title: widget.book.title,
        description: widget.book.description,
        rating: widget.book.rating,
      ),
    );
  }

  bool isBookmarked = false;

  void _addToBookMark(BuildContext context) {
    setState(() {
      isBookmarked = !isBookmarked; // Chuyển đổi trạng thái icon
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _openBookDetail(context);
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.book.imageUrl,
                    height: 120,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.book.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.book.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow),
                            const Icon(Icons.star, color: Colors.yellow),
                            const Icon(Icons.star, color: Colors.yellow),
                            const Icon(Icons.star, color: Colors.yellow),
                            const Icon(Icons.star_half, color: Colors.yellow),
                            const SizedBox(width: 8),
                            Text(
                              widget.book.rating,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  _addToBookMark(context);
                                },
                                child: Icon(
                                  isBookmarked
                                      ? Icons.bookmark
                                      : Icons.bookmark_add_outlined,
                                  color: isBookmarked ? Colors.black : null,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
