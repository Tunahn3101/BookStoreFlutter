import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/ui_bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UIBottomNavigation(),

      // Sử dụng theme
      theme: ThemeData(
        // Xác định độ sáng và màu sắc mặc định
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        // Xác định Text theme mặc định. sử dụng điều này để chỉ định mặc định
        // tạo kiểu văn bản cho tiêu đề, nội dung văn bản
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(
            textStyle: const TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
    );
  }
}
