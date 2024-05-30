import 'package:flutter/material.dart';

class FullscreenModal extends StatefulWidget {
  const FullscreenModal({super.key});

  @override
  State<FullscreenModal> createState() => _FullscreenModalState();
}

class _FullscreenModalState extends State<FullscreenModal> {
  @override
  Widget build(BuildContext context) {
    List<String> data = List.generate(20, (index) => 'Item${index + 1}');

    void onDismissed(int index) {
      setState(() {
        data.removeAt(index);
      });
    }

    // dùng dismissible để loại bỏ item trong listview.builder

    return Scaffold(
      appBar: AppBar(
        title: const Text('Disissible'),
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
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     const SizedBox(height: 50),
      //     ElevatedButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         child: const Text('Back')),
      //     const Text(
      //       'This is a fullscreen modal!',
      //       style: TextStyle(fontSize: 24),
      //     ),
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: items.length,
      //         padding: const EdgeInsets.symmetric(vertical: 16),
      //         itemBuilder: (BuildContext context, int index) {
      //           return Dismissible(
      //             background: Container(
      //               color: Colors.green,
      //               child: const Padding(
      //                 padding: EdgeInsetsDirectional.all(4),
      //                 child: Icon(Icons.delete),
      //               ),
      //             ),
      //             key: ValueKey<int>(items[index]),
      //             onDismissed: (DismissDirection direction) {
      //               setState(() {
      //                 items.removeAt(index);
      //               });
      //             },
      //             child: ListTile(
      //               title: Text(
      //                 'Item ${items[index]}',
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
