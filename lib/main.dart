import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Ô vuông lớn ở giữa
              const SizedBox(
                width: 250.0,
                height: 250.0,
              ),
              // Ô vuông nhỏ ở giữa
              Container(
                width: 150.0,
                height: 150.0,
                color: Colors.red,
              ),
              // Ô vuông ở góc trên bên trái
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  color: Colors.green,
                ),
              ),
              // Ô vuông ở góc trên bên phải
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  color: Colors.green,
                ),
              ),
              // Ô vuông ở góc dưới bên trái
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  color: Colors.green,
                ),
              ),
              // Ô vuông ở góc dưới bên phải
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  color: Colors.green,
                ),
              ),
              // Ô vuông ở giữa trên
              Positioned(
                top: 0.0,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
              ),
              // Ô vuông ở giữa dưới
              Positioned(
                bottom: 0.0,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
              ),
              // Ô vuông ở giữa bên trái
              Positioned(
                left: 0.0,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
              ),
              // Ô vuông ở giữa bên phải
              Positioned(
                right: 0.0,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
