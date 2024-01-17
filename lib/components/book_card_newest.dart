import 'package:flutter/material.dart';
import 'package:learn/pages/my_order_page.dart';

class BookCardVertical extends StatelessWidget {
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

  void _openBookDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyOrderPage(
          imageUrl: imageUrl,
          title: title,
          description: description,
          rating: rating,
        ),
      ),
    );
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
                imageUrl,
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
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      description,
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
                          rating,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        const Spacer(),
                        const Icon(Icons.bookmark_add_outlined),
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
