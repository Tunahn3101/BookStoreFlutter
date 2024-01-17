import 'package:flutter/material.dart';
import 'package:learn/pages/my_order_page.dart';

class BookCard extends StatelessWidget {
  const BookCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description});

  final String imageUrl;
  final String title;
  final String description;

  void _openBookDetail(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyOrderPage(
                  imageUrl: imageUrl,
                  title: title,
                  description: description,
                  rating: '',
                )));
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
              imageUrl,
              height: 210,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              description,
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
