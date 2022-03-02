import 'package:flutter/material.dart';

class OpenPainter extends CustomPainter {
  final Offset offset;

  // final Size size;

  OpenPainter({required this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.yellow.withOpacity(.2)
      ..style = PaintingStyle.fill;
    canvas.drawRect(offset & const Size(200, 30), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
