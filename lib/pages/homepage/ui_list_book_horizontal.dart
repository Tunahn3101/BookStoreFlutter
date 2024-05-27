import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn/common/app_image.dart';
import 'package:learn/components/book_card.dart';
import 'package:learn/pages/homepage/model/book_model.dart';

class UIListBookHorizontal extends StatelessWidget {
  const UIListBookHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BookModel> data = [
      BookModel(
          imageUrl: AppImages.book1,
          title: 'Fashionopolis',
          description: 'Dana Thomas',
          rating: ''),
      BookModel(
          imageUrl: AppImages.book2,
          title: 'Chanel',
          description: 'Jones Leblan',
          rating: ''),
      BookModel(
          imageUrl: AppImages.book3,
          title: 'Nghiệt Duyên',
          description: 'Thomayanati',
          rating: ''),
      BookModel(
          imageUrl: AppImages.book4,
          title: 'No Family',
          description: 'Hector Malot',
          rating: ''),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Books',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 290,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return BookCard(book: data[index]);
            },
          ),
        )
      ],
    );
  }
}
