import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageURL,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageURL,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle action 1
                        },
                        icon: const Icon(Icons.favorite),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          // Handle action 2
                        },
                        icon: const Icon(Icons.share),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sử dụng CustomListItem trong danh sách
class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CustomListItem(
          title: 'Title 1',
          subtitle: 'Subtitle 1',
          imageURL: 'https://example.com/image1.jpg',
        ),
        CustomListItem(
          title: 'Title 2',
          subtitle: 'Subtitle 2',
          imageURL: 'https://example.com/image2.jpg',
        ),
        // Thêm các mục danh sách khác tại đây
      ],
    );
  }
}
