import 'package:flutter/material.dart';
import 'package:learn/theme_provider/theme_prvider.dart';
import 'package:provider/provider.dart';
import 'pages/ui_bottom_navigation.dart';

void main() async {
  runApp(
    MultiProvider(
      // Sử dụng MultiProvider cho việc tích hợp nhiều Provider
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider =
        Provider.of<ThemeProvider>(context, listen: true); // lắng nghe thay đổi

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UIBottomNavigation(),
      theme: ThemeData.light(), // Light theme
      //  ThemeData(
      //   // Xác định độ sáng và màu sắc mặc định

      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.red,
      //     brightness: Brightness.dark,
      //   ),
      //   // Xác định Text theme mặc định. sử dụng điều này để chỉ định mặc định
      //   // tạo kiểu văn bản cho tiêu đề, nội dung văn bản
      //   textTheme: TextTheme(
      //     displayLarge: const TextStyle(
      //       fontSize: 72,
      //       fontWeight: FontWeight.bold,
      //     ),
      //     titleLarge: GoogleFonts.oswald(
      //       textStyle: const TextStyle(
      //         fontSize: 30,
      //         fontStyle: FontStyle.italic,
      //       ),
      //     ),
      //     bodyMedium: GoogleFonts.merriweather(),
      //     displaySmall: GoogleFonts.pacifico(),
      //   ),
      // ),
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: themeProvider.themeMode, // Lắng nghe change Theme
    );
  }
}
