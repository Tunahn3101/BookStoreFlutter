import 'package:flutter/material.dart';
import 'package:learn/pages/my_order_page.dart';

// ignore: must_be_immutable
class BookCardVertical extends StatefulWidget {
  const BookCardVertical({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rating,
  });

  final String imageUrl;
  final String title;
  final String description;
  final String rating;

  @override
  State<BookCardVertical> createState() => _BookCardVerticalState();
}

class _BookCardVerticalState extends State<BookCardVertical> {
  void _openBookDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyOrderPage(
          imageUrl: widget.imageUrl,
          title: widget.title,
          description: widget.description,
          rating: widget.rating,
        ),
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
    return GestureDetector(
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
                widget.imageUrl,
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
                      widget.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.description,
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
                          widget.rating,
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
