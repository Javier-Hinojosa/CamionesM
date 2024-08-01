import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DottedDivider extends StatelessWidget {
   const DottedDivider({super.key, this.width});

  final double? width;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size:  Size(width??Get.width, 1),
      painter: DottedLinePainter()
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 4;
    var dashSpace = 4;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}