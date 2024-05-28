import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChildWidget extends StatelessWidget {
  const ChildWidget({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Data from Parent: $data',
          style: GoogleFonts.supermercadoOne(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
