import 'package:flutter/material.dart';
import 'package:learn/pages/inputtextfield/full_screen_modal.dart';
import 'package:learn/pages/inputtextfield/input_textfield.dart';
import 'package:learn/pages/inputtextfield/new_expense.dart';
import 'package:learn/pages/inputtextfield/validate_forrm_input.dart';
import 'package:learn/pages/mutatingvalues/mutating_values.dart';
import 'package:learn/pages/results/results_screen.dart';
import 'package:learn/ultis/next_screen.dart';

import 'inputtextfield/result_expense.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // sử dụng Mapping List
    List<int> numbers = [1, 2, 3, 4, 5];
    List<int> squaredNumbers =
        numbers.map((number) => number * number).toList();

    print(squaredNumbers);

    // sử dụng Spread Operator(...) cho phép trải các phần tử của một danh sách vào một danh sách mới. hữu ích khi muốn kết gợp nhiều danh sách hoặc thêm phần tử vào danh sách hiện có.

    List<int> list1 = [1, 2, 3];
    List<int> list2 = [4, 5, 6];
    List<int> combinedList = [...list1, ...list2];
    print(combinedList);

    // Kết hợp cả 2 kỹ thuật
    List<int> moreNumbers = [9, 10, 11];
    List<int> finalList = [...squaredNumbers, ...moreNumbers];
    print(finalList);

    List<String> names = ['Alice', 'Bob', 'Charlie'];
    List<Widget> nameWidgets = names.map((name) => Text(name)).toList();
    List<Widget> moreWidgets = [const Text('David'), const Text('Eve')];

    // phương thức hiển thị toàn màn hình
    void showFullScreenModal(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return const FullscreenModal();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyCart'),
        centerTitle: true,
        leading: null,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...nameWidgets,
            ...moreWidgets,
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                nextScreen(context, const MutatingValues());
              },
              child: const Text('Mutating Values'),
            ),
            ElevatedButton(
              onPressed: () {
                nextScreen(
                    context,
                    const ResultScreen(
                      score: 12,
                      resultMessage: 'Greate',
                    ));
              },
              child: const Text('Result Screen'),
            ),
            ElevatedButton(
                onPressed: () {
                  nextScreen(context, const InputTextField());
                },
                child: const Text('Input textField')),
            ElevatedButton(
                onPressed: () {
                  nextScreen(context, const ValidateFormInput());
                },
                child: const Text('Validate Form Input')),
            ElevatedButton(
                onPressed: () {
                  nextScreen(context, const ResultExpense());
                },
                child: const Text('tạo mới expense')),
            ElevatedButton(
                onPressed: () {
                  showFullScreenModal(context);
                },
                child: const Text('Modal FullScreen'))
          ],
        ),
      ),
    );
  }
}
