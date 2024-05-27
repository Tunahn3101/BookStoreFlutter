import 'package:flutter/material.dart';
import 'package:learn/pages/detailsbook/common/action_button.dart';
import 'package:learn/pages/preview.dart';
import 'package:learn/pages/reviews.dart';

class DetailsBook extends StatelessWidget {
  const DetailsBook(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.rating});

  final String imageUrl;
  final String title;
  final String description;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              imageUrl,
              height: 300,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.yellow, size: 24),
              const Icon(Icons.star, color: Colors.yellow, size: 24),
              const Icon(Icons.star, color: Colors.yellow, size: 24),
              const Icon(Icons.star, color: Colors.yellow, size: 24),
              const Icon(Icons.star_border, color: Colors.yellow, size: 24),
              const SizedBox(width: 5),
              Text(
                rating,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              'A spectacular visual journey through 40 years of haute couture from one of the best-known and most trend-setting brands in fashion.',
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyPreview()));
                  },
                  text: 'Preview',
                  icon: Icons.align_horizontal_left_outlined,
                ),
                ActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyReview()));
                  },
                  text: 'Reviews',
                  icon: Icons.chat_outlined,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const SizedBox(
                      height: 500,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Select a payment method',
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black, // Màu chữ trắng
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Bo tròn nút
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 6, bottom: 6),
              child: Text(
                'Buy Now',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
