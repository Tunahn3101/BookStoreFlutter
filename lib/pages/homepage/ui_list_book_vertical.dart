import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn/common/app_image.dart';
import 'package:learn/components/book_card_newest.dart';
import 'package:learn/pages/homepage/model/book_model.dart';

class UIListBookVertical extends StatelessWidget {
  const UIListBookVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BookModel> data = [
      BookModel(
        imageUrl: AppImages.book1,
        title: 'Yves Saint Laurent',
        description: 'Suzy Menkes',
        rating: '4.5',
      ),
      BookModel(
        imageUrl: AppImages.book6,
        title: 'Yves Saint Laurent',
        description: 'Suzy Menkes',
        rating: '4.0',
      ),
      BookModel(
        imageUrl: AppImages.book7,
        title: 'Ilov3you',
        description: 'Mohayder',
        rating: '4.5',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Newest',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return BookCardVertical(book: data[index]);
            },
          ),
        )
      ],
    );
  }
}
