import 'package:flutter/material.dart';

void nextScreen(BuildContext context, Widget pages) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pages,
      ));
}
