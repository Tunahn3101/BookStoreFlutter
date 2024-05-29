import 'package:uuid/uuid.dart';

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
  }) : id = const Uuid().v4(); // khởi tạo id với một giá trị duy nhất
}
