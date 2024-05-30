import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.resultMessage,
    required this.score,
  });
  final int score;
  final String resultMessage;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  DateTime? _selectDate;

  // phương thức chọn ngày
  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectDate) {
      setState(() {
        _selectDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              widget.score.toString(),
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              widget.resultMessage,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectedDate(context),
              child: const Text('Select Date'),
            ),
            const SizedBox(height: 20),
            Text(
              _selectDate == null
                  ? 'No date selected!'
                  : 'Selected date: ${DateFormat('dd-MM-yyyy').format(_selectDate!)}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
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
