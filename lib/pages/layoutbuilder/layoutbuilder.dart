import 'package:flutter/material.dart';

class LayoutBuilderScreen extends StatelessWidget {
  const LayoutBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 500) {
          return const BigScreenWidget();
        } else {
          return const SmallScreenWidget();
        }
      },
    );
  }
}

class BigScreenWidget extends StatelessWidget {
  const BigScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Big'),
      ),
      body: const Center(
        child: Text('Big Screen view'),
      ),
    );
  }
}

class SmallScreenWidget extends StatelessWidget {
  const SmallScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Small'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Small screen view'),
          ),

          // constrainedBox áp đạt các dàng buộc lên con của nó.
          ConstrainedBox(
            constraints: const BoxConstraints.expand(width: 100, height: 100),
            child: const Card(child: Center(child: Text('Hello World!'))),
          )
        ],
      ),
    );
  }
}
