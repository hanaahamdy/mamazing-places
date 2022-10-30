
import 'package:flutter/material.dart';

class CustomCircle extends Decoration {
  final double raduis;
  final Color color;

  CustomCircle({required this.raduis, required this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return PaintCustomCircle(color: color, raduis: raduis);
  }
}

class PaintCustomCircle extends BoxPainter {
  final double raduis;
  final Color color;

  PaintCustomCircle({required this.raduis, required this.color});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    Offset offsett = Offset(
        configuration.size!.width / 3, configuration.size!.height - raduis);
    canvas.drawCircle(offset + offsett, raduis, _paint);
  }
}