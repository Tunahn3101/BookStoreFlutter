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

    // danh sách các phương thức và cách sử dụng chúng với các kiểu dữ liệu như List, Set, Map

    // List

    // map() : áp dụng 1 hàm  cho mỗi phần tử trong danh sách và trả về một iterable  mới với các phần tử đã được chuyển đổi
    List<int> numbers = [1, 2, 3, 4, 5];
    List<int> squares = numbers.map((number) => number * number).toList();
    print(squares);

    // toList() : chuyển đổi một iterable  thành 1 list
    Iterable<int> numberss = [1, 2, 3];
    List<int> numberList = numbers.toList();
    print(numberList);

    // Where() : Lọc các phần tử của một iterable dựa trên một điều kiện cho trước
    List<int> evennNumbers = numbers.where((number) => number.isEven).toList();
    print(evennNumbers);

    // reduce() : gộp các phần tử của một iterable thành một giá trị duy nhất
    int sum = numbers.reduce((value, element) => value + element);
    print(sum);
    // forEch() : Thực hiện một hàm trên mỗi phần tử của iterable
    for (var number in numbers) {
      print(number);
    }
    // expand() : chuyển đổi mỗi phần tử thành một iterable mới và nối kết các iterable này lại với nhau
    List<List<int>> numbersss = [
      [1, 2],
      [3, 4],
    ];
    List<int> flatList = numbersss.expand((element) => element).toList();
    print(flatList);

    // Map
    /// forEch() : Thực hiện một hàm trên mỗi cặp khóa - giá trị của Map
    Map<String, int> scores = {'Alice': 90, 'Bob': 80};
    scores.forEach((key, value) {
      print('$key scored $value');
    });

    // entries() : trả về một iterable các cặp mapentry, mỗi cặp chứa một khóa giá trị tương ứng
    for (var entry in scores.entries) {
      print('${entry.key} scored ${entry.value} ');
    }

    //toSet() : Chuyển đổi một iterable thanh 1 set
    List<int> a = [1, 2, 2, 3];
    Set<int> numberSet = a.toSet();
    print(numberSet);

    // truy cập giá trị bằng khóa
    Map<String, int> agess = {
      'John': 30,
      'Jane': 25,
      'Doe': 40,
    };

    print(agess['John']); // 30
    print(agess['Jane']); // 25

    // Kiểm tra sự tồn tại của khóa
    Map<String, int> agesss = {
      'John': 30,
      'Jane': 25,
      'Doe': 40,
    };

    if (agesss.containsKey('John')) {
      print('John\'s age is ${agesss['John']}');
    } else {
      print('John is not in the map');
    }

    void showSnackBar() {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Battery is full')));
    }

    void showModalSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Modal Bottom Sheet'),
                  ElevatedButton(
                    child: const Text('Close Bottom Sheet'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    void showBatteryFullDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Battery is Full',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade50,
        title: const Text('Result Screen'),
        centerTitle: true,
        // tắt nút quay lại mặc định của appbar
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.only(left: 4),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // hiện thông báo snackbar
              // showSnackBar();
              showBatteryFullDialog(context);
            },
            icon: const Icon(Icons.battery_charging_full_sharp),
            color: Colors.green,
            // color: Colors.green,
          ),
        ],
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
                showModalSheet(context);
              },
              child: const Text('Modal Sheet'),
            ),
          ],
        ),
      ),
    );
  }
}
