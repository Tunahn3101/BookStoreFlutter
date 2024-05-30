import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';
import 'new_expense.dart';

class ResultExpense extends StatefulWidget {
  const ResultExpense({super.key});

  @override
  _ResultExpenseState createState() => _ResultExpenseState();
}

class _ResultExpenseState extends State<ResultExpense> {
  final List<Expense> _userExpenses = [];

  void _addNewExpense(String title, double amount, DateTime date) {
    final newExpense = Expense(
      title: title,
      amount: amount,
      date: date,
    );

    setState(() {
      _userExpenses.add(newExpense);
    });
  }

  void _startAddNewExpense(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewExpense(_addNewExpense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense App'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewExpense(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ..._userExpenses.map((exp) {
              return Card(
                child: ListTile(
                  title: Text(exp.title),
                  subtitle: Text(
                    DateFormat('dd-MM-yyy').format(exp.date),
                  ),
                  trailing: Text('\$${exp.amount.toStringAsFixed(2)}'),
                ),
              );
            }).toList()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewExpense(context),
      ),
    );
  }
}
