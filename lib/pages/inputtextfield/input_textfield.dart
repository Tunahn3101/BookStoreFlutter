import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({super.key});

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  final TextEditingController _namecontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _namecontroller.dispose();
  }

  @override
  void initState() {
    super.initState();
    // nhận thông tin đầu vào của người dùng mỗi lần nhấn phím
    _namecontroller.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    print('value :${_namecontroller.text}');
  }

  void _showInput() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('You entered: ${_namecontroller.text}'),
        );
      },
    );
  }

  // hàm sử dụng Future

  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Hello';
  }

  void getData() async {
    String data = await fetchData();
    print(data);

    // hoặc có thể dùng then để xử lý giá trị trả về từ một Future
    // fetchData().then((data) => print(data));
  }

  // Kết hợp nhiều Futures lại với nhau, sử dụng Future.wait

  Future<void> fetchMultiData() async {
    List<Future<String>> futures = [fetchData(), fetchData(), fetchData()];
    List<String> result = await Future.wait(futures);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // được sử dụng để chỉ định liệu cần resize màn hình để tránh bàn phím ảo hay không mặc định là true
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Input textfield'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 50),
            TextField(
              controller: _namecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showInput();
              },
              child: const Text('Show input'),
            ),
          ],
        ),
      ),
    );
  }
}
