import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  double font_size;
  final Color color;

  AppText(
      {this.font_size = 16, required this.text, this.color = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: font_size, color: color, ),
    );
  }
}
