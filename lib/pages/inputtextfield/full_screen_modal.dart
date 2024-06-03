import 'package:flutter/material.dart';

class FullscreenModal extends StatefulWidget {
  const FullscreenModal({super.key});

  @override
  State<FullscreenModal> createState() => _FullscreenModalState();
}

class _FullscreenModalState extends State<FullscreenModal> {
  @override
  Widget build(BuildContext context) {
    // dùng dismissible để loại bỏ item trong listview.builder

    return Scaffold(
      appBar: AppBar(
        title: const Text('Disissible'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back')),
            const Text(
              'This is a fullscreen modal!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
