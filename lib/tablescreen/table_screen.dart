import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Table Screen'),
          centerTitle: true,
        ),
        body: Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          border: TableBorder.all(),
          children: const [
            // Định nghĩa hàng đầu tiên (có thể là tiêu đề của bảng)
            TableRow(children: [
              Text('Tên cột 1'),
              Text('Tên cột 2'),
              Text('Tên cột 3'),
            ]),
            // Các hàng tiếp theo chứa dữ liệu
            TableRow(children: [
              Text('Dữ liệu hàng 1, cột 1'),
              Text('Dữ liệu hàng 1, cột 2'),
              Text('Dữ liệu hàng 1, cột 3'),
            ]),
            // Thêm nhiều TableRow tương tự để hoàn thành bảng
            TableRow(children: [
              Text('Dữ liệu hàng 2, cột 1'),
              Text('Dữ liệu hàng 2, cột 2'),
              Text('Dữ liệu hàng 2, cột 3'),
            ]),
          ],
        ));
  }
}
