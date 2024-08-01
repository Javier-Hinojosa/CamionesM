import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardReduce extends StatelessWidget{
  const CustomCardReduce({super.key,required this.child, this.backgroundColor, this.circularRadius=20});
  final Widget child;
  final Color? backgroundColor;
  final double circularRadius;
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(circularRadius),
        borderOnForeground: true,
        color: backgroundColor,
        child: SizedBox(
          width: Get.width,
          child: child
      ).paddingAll(10)
    );
  }


}