import 'package:flutter/material.dart';
import 'package:learn/pages/homepage/ui_avatar.dart';
import 'package:learn/pages/homepage/ui_list_book_horizontal.dart';
import 'package:learn/pages/homepage/ui_list_book_vertical.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              UIAvatar(),
              UIListBookHorizontal(),
              SizedBox(height: 10),
              UIListBookVertical(),
            ],
          ),
        ),
      ),
    );
  }
}
