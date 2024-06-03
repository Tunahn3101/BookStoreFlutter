import 'package:flutter/material.dart';
import 'package:learn/pages/passingdataviafunctions/child_widget.dart';

import 'question.dart';

class MutatingValues extends StatefulWidget {
  const MutatingValues({super.key});

  @override
  State<MutatingValues> createState() => _MutatingValuesState();
}

class _MutatingValuesState extends State<MutatingValues> {
  int _counter = 0;
  int _currentQuestionIndex = 0;

  // câu hỏi tiếp

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++;
      }
    });
  }

  // câu hỏi trước
  void _previousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      ++_counter;
    });
  }

  void _decrementCounter() {
    setState(() {
      --_counter;
    });
  }

  String data = 'Hello from Parent';

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thay đổi và lưu trữ giá trị trong biến '),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text('Counter values: $_counter'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text('Decrement'),
                ),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Increment'),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text('Quản lý trạng thái của mục câu hỏi'),
            const SizedBox(height: 4),
            Text(
              currentQuestion.questionText,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 4),
            ...currentQuestion.answer.map((answer) {
              return ElevatedButton(
                onPressed: () {
                  // handle answer question
                },
                child: Text(answer),
              );
            }).toList(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: _previousQuestion,
                    child: const Text('Previous'),
                  ),
                if (_currentQuestionIndex < questions.length - 1)
                  ElevatedButton(
                    onPressed: _nextQuestion,
                    child: const Text('Next'),
                  ),
              ],
            ),
            const Text('Parent Widget'),
            const SizedBox(height: 4),
            Center(
              child: ChildWidget(
                data: data,
              ),
            )
          ],
        ),
      ),
    );
  }
}
