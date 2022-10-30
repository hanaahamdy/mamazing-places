import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final String text;
  double font_size;
  final Color color;

  LargeText(
      {this.font_size = 30, required this.text, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: font_size, color: color, fontWeight: FontWeight.bold),
    );
  }
}
