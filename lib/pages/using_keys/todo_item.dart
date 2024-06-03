import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final bool isDone;
  final VoidCallback onToggle;

  const TodoItem({
    Key? key,
    required this.title,
    required this.isDone,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isDone,
        onChanged: (bool? value) {
          onToggle();
        },
      ),
    );
  }
}
