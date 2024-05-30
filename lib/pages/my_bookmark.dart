import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn/models/expense.dart';

class MyBookMark extends StatelessWidget {
  const MyBookMark({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Expense> expense = [
      Expense(
        title: 'Groceries',
        amount: 50.99,
        date: DateTime.now(),
      ),
      Expense(
        title: 'Electricity Bill',
        amount: 30.00,
        date: DateTime.now(),
      ),
      Expense(
        title: 'Internet Subscription',
        amount: 20.00,
        date: DateTime.now(),
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyBookMark'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: expense.length,
          itemBuilder: (context, index) {
            final exp = expense[index];
            String formattedDate =
                DateFormat('dd/MM/yyyy').format(DateTime.now());

            return Column(
              children: [
                ListTile(
                  title: Text(
                    exp.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  subtitle: Text(DateFormat('dd-MM-yyyy').format(exp.date)),
                  trailing: Text('\$${exp.amount.toStringAsFixed(1)}'),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.blue,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      formattedDate,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            );
          },
        ));
  }
}
