import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.resultMessage,
    required this.score,
  });
  final int score;
  final String resultMessage;

  @override
  Widget build(BuildContext context) {
    Map<String, int> ages = {
      'John': 30,
      'Jane': 25,
      'Doe': 40,
    };
    //truy cập giá trị trong 1 key trong Map
    print(ages['John']);

    // thêm một cặp key-value mới vào Map
    ages['Alice'] = 35;

    // xóa một cặp key-value từ map
    ages.remove('Doe');

    // lặp qua tất cả các cặp key-value

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Điểm số của bạn:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              score.toString(),
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              resultMessage,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Xử lý khi người dùng nhấn nút
              },
              child: const Text('Quay lại'),
            ),
          ],
        ),
      ),
    );
  }
}
