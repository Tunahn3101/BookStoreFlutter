import 'package:flutter/material.dart';

import 'todo_item.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todos = ['Mua sắm', 'Học bài', 'Làm bài tập Flutter'];
  final List<bool> _doneStatus = [false, false, false];

  void _toggleDone(int index) {
    setState(() {
      _doneStatus[index] = !_doneStatus[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          // Sử dụng ValueKey để đảm bảo mỗi todo item giữ đúng trạng thái của nó
          // khi danh sách cập nhật
          return TodoItem(
            key: ValueKey(_todos[index]),
            title: _todos[index],
            isDone: _doneStatus[index],
            onToggle: () => _toggleDone(index),
          );
        },
      ),
    );
  }
}
