import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardDeformed extends StatelessWidget{
  const CustomCardDeformed({super.key,required this.child, this.height=0.6});

 final Widget child;
 final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width*0.9,
      height: Get.height*height,
      child: CustomPaint(
        painter: CardPainter(),
        child: child.paddingAll(10)
      ),
    );
  }
}

class CardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path = Path();
    path.moveTo(size.width*0.06634304,0);
    path.lineTo(size.width*0.9352751,0);
    path.cubicTo(size.width*0.9710227,0,size.width,size.height*0.02261187,size.width,size.height*0.05050505);
    path.lineTo(size.width,size.height*0.8157449);
    path.cubicTo(size.width,size.height*0.8436389,size.width*0.9710227,size.height*0.8662500,size.width*0.9352751,size.height*0.8662500);
    path.lineTo(size.width*0.8677638,size.height*0.8662500);
    path.cubicTo(size.width*0.8320194,size.height*0.8662500,size.width*0.8030388,size.height*0.8888611,size.width*0.8030388,size.height*0.9167551);
    path.lineTo(size.width*0.8030388,size.height*0.9494949);
    path.cubicTo(size.width*0.8030388,size.height*0.9773889,size.width*0.7740615,size.height,size.width*0.7383139,size.height);
    path.lineTo(size.width*0.06634304,size.height);
    path.cubicTo(size.width*0.03059647,size.height,size.width*0.001618123,size.height*0.9773889,size.width*0.001618123,size.height*0.9494949);
    path.lineTo(size.width*0.001618123,size.height*0.05050505);
    path.cubicTo(size.width*0.001618123,size.height*0.02261187,size.width*0.03059647,0,size.width*0.06634304,0);
    path.close();


    Paint paint = Paint()..style=PaintingStyle.fill;
    paint.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path,paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}