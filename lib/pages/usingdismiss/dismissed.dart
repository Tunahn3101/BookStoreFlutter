import 'package:flutter/material.dart';

class Dismissedd extends StatefulWidget {
  const Dismissedd({super.key});

  @override
  State<Dismissedd> createState() => _DismisseddState();
}

class _DismisseddState extends State<Dismissedd> {
  List<String> data = List.generate(20, (index) => 'Item${index + 1}');

  void onDismissed(int index) {
    setState(() {
      data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissed'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Dismissible(
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$item đã bị loại bỏ')));
              onDismissed(index);
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            key: ValueKey(item), // Sử dụng ValueKey với giá trị của item
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
    );
  }
}
