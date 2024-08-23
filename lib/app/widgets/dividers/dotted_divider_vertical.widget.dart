import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerticalDottedDivider extends StatelessWidget {
  const VerticalDottedDivider({super.key, this.height, this.dashSpace = 4,this.strokeWidth=1, this.color});

  final double? height;
  final int dashSpace;
  final Color? color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(1, height ?? Get.height),
      painter: VerticalDottedLinePainter(dashSpace,color, strokeWidth));
  }
}

class VerticalDottedLinePainter extends CustomPainter {
  final int dashSpace;
  final Color? color;
  final double strokeWidth;
  VerticalDottedLinePainter(this.dashSpace, this.color, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color??Colors.black
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    var max = size.height; // Cambiamos a altura en lugar de ancho
    var dashHeight = 4;
    var dashSpace = this.dashSpace;
    double startY = 0;

    // Dibuja líneas a lo largo del eje vertical
    while (startY < max) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}